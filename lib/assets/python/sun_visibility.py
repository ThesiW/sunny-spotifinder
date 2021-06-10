# Loading the relevant packages: numpy, pandas, sweden_crs_transformations,
# datetime, and astropy

# Generic numerical and data-table manipulation packages/libraries:
import numpy as np
import pandas as pd

# The sweden_crs_transformations-library converts from (lat, long) to SWEREF:
from sweden_crs_transformations.crs_projection import CrsProjection
from sweden_crs_transformations.crs_coordinate import CrsCoordinate

# The astropy-library allows us to find the relative positions of a point on
# earth and the sun, as well as track timing-data:
import astropy.coordinates as coord
from astropy.time import Time
import astropy.units as u

# The datetime package allows us to input "15 minutes from now" adjustments to
# which time astropy uses to find sun angles:
from datetime import timedelta as tdelta

# This line simply allows the back-end user to get a sense for when the program
# begins to execute:
t_start = Time.now()

# These lines import the user-data from the .csv-file in the local directory:
file_name = 'lib/assets/python/user_data.csv'
df_user = pd.read_csv(file_name, header=None, sep = ",")
df_user.columns = ['user_lat', 'user_long', 'when_days', 'when_hours', 'when_minutes', 'sun_shine']
for i in range(9):

    user_lat = df_user.iloc[i,0]
    user_long = df_user.iloc[i,1]
    when_days = df_user.iloc[i,2]
    when_hours = df_user.iloc[i,3]
    when_minutes = df_user.iloc[i,4]
    sun_shine = df_user.iloc[i,5]
# df_user
# These lines convert the columns in the user_data.csv-file into input parameters
# for the functions/computations below:
    user_lat = df_user['user_lat'][0]
    user_long = df_user['user_long'][0]
    when_days = df_user['when_days'][0]
    when_hours = df_user['when_hours'][0]
    when_minutes = df_user['when_minutes'][0]
    sun_shine = df_user['sun_shine'][0]

    # These lines convert the columns in the user_data.csv-file into input parameters
    # for the functions/computations below:


    # Specifically, this specifies the time that astropy's sun-locating algorithms
    # use to find the angular position of the sun:
    user_time = Time.now()+tdelta(days=float(when_days),hours=float(when_hours),minutes=float(when_minutes))

    # This line imports the .csv-file that contains the SWEREF-positions of most of
    # central Stockholm into an easily manipulated data-type (a "Pandas DataFrame"):
    file_name = '657_67_7550_2011.csv'
    df_xyz = pd.read_csv(file_name, header=None, sep = " ")
    df_xyz.columns = ['sweref_x', 'sweref_y', 'sweref_z']
    df_xyz.head()

    # The SWEREF-data-set seems to ONLY contain integer+1/2 positions for
    # (x,y)-positions. Hence this function:
    def round_to_half_int(num):
        ret = round(num/2,0)*2
        if ret > num:
            return 1+ret + 1/2
        return 1+ret - 1/2

    # This function uses the sweden_crs_transformations-library to convert
    # (user_lat, user_long) to a SWEREF-position:
    def lat_long_to_sweref(lat, long):
        conv_dict: CrsCoordinate = CrsCoordinate.create_coordinate(CrsProjection.WGS84, lat, long)
        cord_dict = conv_dict.transform(CrsProjection.SWEREF_99_TM)
        sweref_x, sweref_y = cord_dict.get_longitude_x(), cord_dict.get_latitude_y()
        return round_to_half_int(sweref_x), round_to_half_int(sweref_y)

    # Simple function that converts degrees-minutes-seconds-notation to degrees in
    # floating-point notation.
    # This function is necessary, I think, in order for our main function to work
    # with "normal" code below.
    def ang_to_dec(ang):
        ang_deg = str(ang).split("d")[0]
        ang_min_sec = (str(ang).split("d")[1]).split("m")
        ang_min = ang_min_sec[0]
        ang_sec = ang_min_sec[1][0:-1]
        return float(ang_deg) + float(ang_min)/60 + float(ang_sec)/3600

    # Main function, which inputs the user's location, as measured in (lat, long)
    # coordinates and, if so desired
    # a certain period into the future (or past), and returns the sun's angular
    # position in the user's sky.
    def sun_ang_pos(user_lat, user_long, user_time):
        user_loc_abs = coord.EarthLocation(lon=user_long * u.deg,lat=user_lat * u.deg)
        user_loc_ang = coord.AltAz(location=user_loc_abs, obstime=user_time)
        sun_loc_abs = coord.get_sun(user_time)
        sun_angle_from_east = round(ang_to_dec(sun_loc_abs.transform_to(user_loc_ang).alt),6)
        sun_angle_from_horizon = round(ang_to_dec(sun_loc_abs.transform_to(user_loc_ang).az),6)
        return sun_angle_from_east, \
               sun_angle_from_horizon, \
               f"""    At {user_time}-UTC, an observer located at {(user_lat, user_long)} (near Stockholm!) will
    see the sun at {sun_angle_from_east} degrees from East & {sun_angle_from_horizon} degrees above the horizon."""

    error_string = "That location is outside of the limits of our database"

    # This function associates {the SWEREF-location that the user wants to visit} to
    # {a specific row in the SWEREF .csv-file}:
    def lat_long_to_sweref_row(user_lat, user_long):
        x_filter = lat_long_to_sweref(user_lat, user_long)[0]
        y_filter = lat_long_to_sweref(user_lat, user_long)[1]
        user_row = df_xyz[(df_xyz['sweref_x'] == x_filter) & (df_xyz['sweref_y'] == y_filter)]
        if len(np.array(user_row)) > 0:
            return user_row
        return error_string

    # Our first function here simply unifies the sun-ray-angle and
    # user-SWEREF_99_TM-location data in one function:
    def ray_data_now(user_lat, user_long, user_time):
        xy_ang = sun_ang_pos(user_lat, user_long, user_time)[1]
        z_ang = sun_ang_pos(user_lat, user_long, user_time)[0]
        x_user = np.array(lat_long_to_sweref_row(user_lat, user_long))[0][0]
        y_user = np.array(lat_long_to_sweref_row(user_lat, user_long))[0][1]
        z_user = np.array(lat_long_to_sweref_row(user_lat, user_long))[0][2]
        return xy_ang, z_ang, x_user, y_user, z_user

    # This single-use function (which breaks if called again (not sure why))
    # computes the x-distance, y-distance, xy-distance, xy-angle, and z-angle
    # between {the SWEREF-row corresponding to the user's desired location} and
    # {all other SWEREF locations}:
    def df_xyz_angles(user_lat, user_long):
        df_xyz_angles = df_xyz
        user_x = np.array(lat_long_to_sweref_row(user_lat, user_long))[0][0]
        user_y = np.array(lat_long_to_sweref_row(user_lat, user_long))[0][1]
        user_z = np.array(lat_long_to_sweref_row(user_lat, user_long))[0][2]
        rad_deg = (360)/(2*np.pi)
        df_xyz_angles["x_user_dist"] = (df_xyz['sweref_x']-user_x)
        df_xyz_angles["y_user_dist"] = (df_xyz['sweref_y']-user_y)
        df_xyz_angles["xy_user_dist"] = (df_xyz_angles["x_user_dist"]**2 +df_xyz_angles["y_user_dist"]**2)**(1/2)
        df_xyz_angles["z_angle_user"] = rad_deg*np.arctan((df_xyz['sweref_z']-user_z)/df_xyz_angles["xy_user_dist"])
        df_xyz_angles["xy_user_angle"] = rad_deg*np.arctan2(df_xyz_angles["x_user_dist"],df_xyz_angles["y_user_dist"])
        return df_xyz_angles

    # This simply ascribes the output of the previous function to a fixed object of
    # the same name:
    df_xyz_angles = df_xyz_angles(user_lat, user_long)

    # This function explicitly displays the sun's angle relative to East
    # (i.e. the xy-angle) and the sun's angle relative to the horizon
    # (i.e. the z-angle) at the user's (lat, long)-location at the time that the
    # user is interested in:
    def sun_ang_xyz(user_lat, user_long, user_time):
        sun_xy = sun_ang_pos(user_lat, user_long, user_time)[1]
        sun_z = sun_ang_pos(user_lat, user_long, user_time)[0]
        if sun_xy > 180:
            sun_xy = sun_xy-360
        return sun_xy, sun_z

    # Here, we explicitly define the sun_xy_angle (angle from East):
    sun_xy_ang = sun_ang_xyz(user_lat, user_long, user_time)[0]
    # Here, we specify an angular-tolerance: If two points have are within this
    # xy_angle-tolerance, then they MIGHT block the sun:
    sun_xy_ang_std = 3

    # Here, we explicitly define the sun_z_angle (angle above horizon):
    sun_z_ang = sun_ang_xyz(user_lat, user_long, user_time)[1]

    # Here, we compute the difference between {the xy_angle between the
    # user-position} and {the xy_angle of the sun in the sky}. We compute this
    # difference for each-and-every position in the SWEREF-chart.
    df_xyz_angles['xy_angle_diff'] = df_xyz_angles['xy_user_angle'] - sun_xy_ang
    # All points where this number is small are points that may possibly block the
    # sun from shining on the specific (lat, long, time)-location that the user is
    # interested in. So, in this step, we chop-out all points where this relative
    # angle is large:
    df_ray = df_xyz_angles[ (df_xyz_angles['xy_angle_diff'] < sun_xy_ang_std) &\
                           (df_xyz_angles['xy_angle_diff'] > -sun_xy_ang_std) ]

    # Here, we drop out all of the columns in this table that don't directly have
    # to do with angles and absolute positions:
    df_ray = df_ray[['sweref_x', 'sweref_y', 'sweref_z', 'z_angle_user', 'xy_user_angle', 'xy_angle_diff']]
    # This line is the second most important of the whole script. Here, we compute
    # the difference between {the z-angle of all objects that *might* be between
    # the sun and the user's desired (lat, long, time) position} and {the z-angle
    # of the sun}:
    df_ray['z_angle_diff'] = df_ray['z_angle_user'] - sun_z_ang
    # This line is the most important of the whole script. Here, we only consider
    # the list of points in the SWEREF-database that are in the xy-direction of the
    # sun, which are also "taller" on the horizon than the sun is, i.e. whose
    # z_angle is higher than the sun's z_angle. The crucial aspect of this line is
    # that IF there are more than zero points in this list, then the sun is blocked!
    df_ray = df_ray[ (df_ray['z_angle_diff'] > 0) ]

    # This function simply then checks whether there are more than zero elements in
    # the above list. If there are more than zero elements, then the sun is blocked
    # and the function returns "False", i.e. "the sun isn't visible at the desired
    # time-and-location". Otherwise, it returns "True", i.e. "the sun is/will indeed
    # be shining on this place where you want to go, at your desired arrival time":
    def sun_shine():
        if df_ray.shape[0] == 0:
            return True
        return False

    # This line simply updates the "sun_shine" element in the user's .csv-file, to
    # indicate the result of the program:
    df_user['sun_shine'] = sun_shine()

    # These lines simply print this result to a .csv-file of the same name:
    df_user.to_csv(path_or_buf='lib/assets/python/user_data.csv', sep = ",", header=None, index=False)

    # This line simply records the time when the program stopped running.
    t_stop = Time.now()

    # These lines are for the back-end user, and return "T/F" for sunshine, the
    # start-time, stop-time, and their difference, so that the back-end user can
    # get a sense for how quickly this program ran.
    print(sun_shine())
    print(t_start)
    print(t_stop)
# print((t_finish-t_start)*24*3600)

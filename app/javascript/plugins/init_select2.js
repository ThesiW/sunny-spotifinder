 import $ from 'jquery';
 import 'select2';

const initSelect2 = () =>{
  const cafe = ["Scandwich","BodyBuddy","Cykelcafé Le Mond","Kaferang","Mahalo Söder","1889 Fast Fine Pizza","Steninge Bruk","Fosch Artisan Pâtisserie Löjtnantsgatan","Gigafood","Gildas Rum","Systrarna Andersson","Mahalo Odengatan","The Italian Cousins Odengatan","Artipelagstigen 1"]
   $('#cafe-input').select2({ width: '100%' });
}

export {initSelect2}

// const cafe = ["Scandwich","BodyBuddy","Cykelcafé Le Mond","Kaferang","Mahalo Söder","1889 Fast Fine Pizza","Steninge Bruk","Fosch Artisan Pâtisserie Löjtnantsgatan","Gigafood","Gildas Rum","Systrarna Andersson","Mahalo Odengatan","The Italian Cousins Odengatan","Artipelagstigen 1"]

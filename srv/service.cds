using {Stores_Brands as Luxasia} from '../db/Stores_Brands';
using {stores as ss} from '../db/data-model';
using Brands as _Brands from '../db/data-model';
using Product_Cost from '../db/data-model';

@requires: 'authenticated-user'

service LuxasiaSB @(path: '/luxasia/oDataV4') {

    entity Users         as projection on Luxasia.USER1;
    entity STORE         as projection on Luxasia.STORE1;
    entity Brand        as projection on Luxasia.BRAND1;
    entity ZSDR_PS_CE_DV as projection on ss.ZSDR_PS_CE_DV;
    entity WRF_BRANDS_T  as projection on ss.WRF_BRANDS_T;
    entity ZSD_REFVKORG  as projection on ss.ZSD_REFVKORG;
    entity MAKT          as projection on ss.MAKT;
    entity MVKE          as projection on ss.MVKE;
    entity A073          as projection on ss.A073;
    entity KONP          as projection on ss.KONP;
    entity ZSDR_PS_CE_MVKE as projection on ss.ZSDR_PS_CE_MVKE;

    @readonly
    entity Brands        as projection on _Brands;
    @readonly
    
    entity ProductCost(IP_WERKS: String(4),IP_BRAND_ID:String(18)) as
    select from Product_Cost (IP_WERKS: :IP_WERKS , IP_BRAND_ID: :IP_BRAND_ID)
        {
            *
        };


}

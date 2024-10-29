using {Stores_Brands as Luxasia} from '../db/Stores_Brands';
using {stores as ss} from '../db/data-model';
using Brands as _Brands from '../db/data-model';
using Product_Cost from '../db/data-model';
using Product_StorageUnit from '../db/data-model';
using Purchase_Order from '../db/data-model';
using Customer as Customers from '../db/data-model';
using CV_Customer_V1 from '../db/data-model';

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
    // entity ADRC  as projection on ss.ADRC;
    // entity KNA1  as projection on ss.KNA1;
    // entity ADR6  as projection on ss.ADR6;


    @readonly
    entity Brands        as projection on _Brands;
    @readonly
    entity ProductCost(IP_WERKS: String(4),IP_BRAND_ID:String(18)) as
    select from Product_Cost (IP_WERKS: :IP_WERKS , IP_BRAND_ID: :IP_BRAND_ID)
        {
            *
        };

    @readonly
    entity ProductStorageUnit(IP_WERKS: String(4),IP_LGORT:String(4)) as
    select from Product_StorageUnit (IP_WERKS: :IP_WERKS , IP_LGORT: :IP_LGORT)
        {
            *
        };
    @readonly
    entity PurchaseOrder(IP_WERKS: String(4),IP_SUPP_WERKS : String(4), IP_SUPP_VEND : String(20), IP_BRAND_ID : String(18)) as
    select from Purchase_Order (IP_WERKS: :IP_WERKS ,IP_SUPP_WERKS: :IP_SUPP_WERKS , IP_SUPP_VEND::IP_SUPP_VEND,IP_BRAND_ID: :IP_BRAND_ID )
        {
            *
        };
    
    @readonly
    entity  Customer as projection on Customers;

    @readonly
    entity CustomerV1 (IP_FNAME : String(35), IP_LNAME : String(35), IP_EMAIL : String(241), IP_TEL_PHONE : String(30)) as 
        select from CV_Customer_V1 (
            IP_FNAME: :IP_FNAME, IP_LNAME: :IP_LNAME, IP_EMAIL: :IP_EMAIL, IP_TEL_PHONE: :IP_TEL_PHONE
        ) {
            *
        };

    action insert(
                  mandt:String,
                  kunnr : String,
                  addrnumber : String,
                  parnr:String,
                  dob:String,
                  marketcon:String,
                  client : String,
                  date_from : String,
                  nation : String,
                  name1 : String,
                  name2 : String,
                  tel_number : String,
                  city:String,
                  pcode:String,
                  street:String,
                  persnumber : String,
                  consumer : String,
                  smtp_addr : String) returns Integer;



}

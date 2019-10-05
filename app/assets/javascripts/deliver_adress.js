$(function(){
  $("#user_deliver_adress_attributes_postcode").jpostal({
    postcode : [ "#user_deliver_adress_attributes_postcode" ],
    address  : {
                  "#user_deliver_adress_attributes_prefecture_code" : "%3",
                  "#user_deliver_adress_attributes_city"            : "%4",
                  "#user_deliver_adress_attributes_adress1"          : "%5%6%7"
                }
  })
})
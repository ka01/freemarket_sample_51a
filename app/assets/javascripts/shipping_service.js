$(function(){
  $(document).on('change','#item_shipping_attributes_fee_burden',function(e){
    $('.shipping-service-form').css({
      'display': 'block'
    })
    var fee_burden = $("#item_shipping_attributes_fee_burden").find('option:selected').text()
    if (fee_burden =='着払い(購入者負担)'){
      $('#item_shipping_attributes_service').find("[value='rakuraku']").hide()
      $('#item_shipping_attributes_service').find("[value='letterpack']").hide()
      $('#item_shipping_attributes_service').find("[value='postal']").hide()
      $('#item_shipping_attributes_service').find("[value='clickpost']").hide()
      $('#item_shipping_attributes_service').find("[value='yupaket']").hide()
      $('#item_shipping_attributes_service').val("")
    }else{
      $('#item_shipping_attributes_service').find("[value='rakuraku']").show()
      $('#item_shipping_attributes_service').find("[value='letterpack']").show()
      $('#item_shipping_attributes_service').find("[value='postal']").show()
      $('#item_shipping_attributes_service').find("[value='clickpost']").show()
      $('#item_shipping_attributes_service').find("[value='yupaket']").show()
      $('#item_shipping_attributes_service').val("")
    }
  })
})
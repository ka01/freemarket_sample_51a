[32m.[0m[31mF[0m[32m.[0m[31mF[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m[32m.[0m

Failures:

  1) ItemsController POST #pay ルートパスにリダイレクトされます
     [31mFailure/Error: [0mpost [33m:pay[0m, [35mparams[0m: params[0m
     [31m[0m
     [31mNameError:[0m
     [31m  undefined local variable or method `params' for #<RSpec::ExampleGroups::ItemsController::POSTPay:0x00007ff4f86ade80>[0m
     [36m# ./spec/controllers/items_controller_spec.rb:11:in `block (3 levels) in <top (required)>'[0m

  2) Item#create 名前が無いとだめ
     [31mFailure/Error: [0m[32mexpect[0m(item.errors[[33m:name[0m]).to include([31m[1;31m"[0m[31mcan't be blank[1;31m"[0m[31m[0m)[0m
     [31m  expected [] to include "can't be blank"[0m
     [36m# ./spec/models/item_spec.rb:7:in `block (3 levels) in <top (required)>'[0m

Finished in 0.44875 seconds (files took 2.97 seconds to load)
[31m28 examples, 2 failures[0m

Failed examples:

[31mrspec ./spec/controllers/items_controller_spec.rb:10[0m [36m# ItemsController POST #pay ルートパスにリダイレクトされます[0m
[31mrspec ./spec/models/item_spec.rb:4[0m [36m# Item#create 名前が無いとだめ[0m


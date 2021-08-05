

# Import
1: Irrigation/src/components/DataCollector.java 
messageArrived:
CreateFarmID  Line 40
changeFarmId Line 46
setDeviceId Line 49
RandomNumber Line 95
Q:  PutWhenUnVerify: ?? Line 102. Put is return message ?? 
// Todo: check function topic: Line 103
// Todo: FarmID: line 109
// Todo: verifyUser: line 106

2 : Irrigation/src/components/Converter.java
Q: 5F, 10F tức là sao vậy ,
(Irrigation/src/components/controller/LoopController.java -- start - line 25) 
(Irrigation/src/components/Converter.java -- pumpSpeed - line 4) 


=> Target all in Model folder 
==> DAO Folder: CRUD data

Todo: Password is hash in client => check is correct in server: Line 90


Irrigation/src/components/autoController/Optimizer.java: Tính toán tưới tiêu => Đoc hiểu => giữ nguyên luông xử lý
Irrigation/src/components/autoController/HumidityModel.java: Thiết lập thông số tưới tiêu á ??
scaleMinMax Line 42: 
(Độ ẩm) 


+ importKerasSequentialModelAndWeights() File import là file binary nên chưa hiêu lắm




ControllingDataSeeder: có cần tìm hiểu luôn source code không ?
1: EchonetLite_over_Lora/Gateway/src/test/components/ControllingDataSender.java

+ LoopController Line 12:
+ onReceivedControllingData: Line 30:

2: EchonetLite_over_Lora/Gateway/src/utilites/Helper.java
+ convertDeviceIdToFarmId Line: 94

3: EchonetLite_over_Lora/Gateway/src/test/components/controller/.java
+ CycleController@start: Line 26

4: EchonetLite_over_Lora/Gateway/src/test/components/controller/LoopController.java
+ LoopController@run Line 22 



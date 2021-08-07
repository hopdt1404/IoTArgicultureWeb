package components.autoController;

import Connector.DBConnector;
import DAO.DeviceDao;
import model.Device;
import sun.awt.X11.XSystemTrayPeer;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class MPC {
    private static DeviceControlUnitManager dcum;
    private static Optimizer optimizer;
    public MPC(){
        optimizer = new Optimizer();
        // create new DeviceControllerUnit
        dcum = DeviceControlUnitManager.getInstance();
        System.out.println("DCUM: "+dcum);
    }
    /**
     * hàm này sẽ thực hiện những xử lý sau:
     * - lấy ra những DeviceControlUnit cần thực hiện và thực hiện chúng
     * - để tránh việc xử lý 1 DCU quá lâu khiến cho các DCU khác không được thực hiện vì quá thời gian, chương trình
     * sẽ lấy DCU ra trước rồi mới thực hiện
     * - hàm sẽ kiểm tra xem DCU có đang ở chế độ tưới tự động hay không. Nếu phải thì mới thực hiện. Nếu không thì loại
     * ra khỏi queue. Sau khi thực hiện thì lại add vào queue
     * - khi 1 DCU được chuyển sang chế độ tưới tự động, nó sẽ ngay lập tức đưa vào queue.(CHƯA THỰC HIỆN)
     */
    public void process() {
        System.out.println("processing....");
        boolean isPrint = false;
        while(true) {
            LocalTime now = LocalTime.now();
            System.out.println("now");
            System.out.println(now);
            if(now.getSecond()%30==0) {
                if(!isPrint) System.out.println(now);
                isPrint=true;
            }else{
                isPrint=false;
            }
            if(!dcum.isEmpty()) {
                System.out.println("if !dcum.isEmpty()");
//                if((now.getMinute())==0){
//                    System.out.println(now.withNano(0).withSecond(0).compareTo(dcum.peek().getLatestIrrigationTime().plusHours(1).withNano(0).withSecond(0)));
//                }
                System.out.println("now.withNano(0).withSecond(0)");
                System.out.println(now.withNano(0).withSecond(0));
                if(now.withNano(0).withSecond(0).compareTo(dcum.peek().getLatestIrrigationTime().plusHours(1).withNano(0).withSecond(0))==0){
                    System.out.println("NOW: "+now+" DCU TIME: "+dcum.peek().getLatestIrrigationTime());
                    ArrayList<DeviceControlUnit> dcus = new ArrayList<DeviceControlUnit>();
                    // tranh TH xu ly lau hon 1 phut
                    while((!dcum.isEmpty())&&(now.withNano(0).withSecond(0).compareTo(dcum.peek().getLatestIrrigationTime().plusHours(1).withNano(0).withSecond(0))==0)){
                        System.out.println("REMOVE...");
                        dcus.add(dcum.remove());
                    }
                    System.out.println(dcus.size());
                    System.out.println("\n------\nDeviceControlUnits will process:\n" +dcus+"\n------\n");
                    //System.out.println("exist loop...");
                    for(DeviceControlUnit dcu: dcus){
                        if(dcu.needProcess()) {
                            System.out.println("OPTIMIZE");
                            System.out.println(dcu);
                            optimizer.process(dcu);
                            dcum.add(dcu);
                        }
                    }
                }
            } else {
                System.out.println("else !dcum.isEmpty()");
            }
        }
    }

    public static void main(String[] args) throws InterruptedException {
//        System.out.println("Start Main Function");
        MPC mpc = new MPC();
//        System.out.println("new mpc: ");
//        System.out.println(mpc);
        System.out.println("Start Loop For");
        // get all device status is true
        DeviceDao deviceDao = new DeviceDao();
        List<Device> listDevice = deviceDao.getDeviceByStatus(1);
        System.out.println("listDevice");
        System.out.println(listDevice);

        Iterator<Device> currentDevice = listDevice.iterator();
        System.out.println("Device Control Unit before");
        while (currentDevice.hasNext()) {
            DeviceControlUnit dcu = new DeviceControlUnit(currentDevice.next().getDeviceID());
            System.out.println("dcu new ");
            System.out.println(dcu);
            dcum.add(dcu);
            Thread.sleep(5000);
        }
        mpc.process();
        //optimizer.process(dcu);
//        LocalTime time1=LocalTime.of(23,0);
//        LocalTime time2=LocalTime.of(0,0);
//        System.out.println(time1.compareTo(time2));
    }
}

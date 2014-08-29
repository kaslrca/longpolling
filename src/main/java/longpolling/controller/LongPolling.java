package longpolling.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/longpolling")
public class LongPolling {

    @RequestMapping(value="/hello/{name}",method = RequestMethod.GET)
    @ResponseBody
    public String hello(@PathVariable String name) throws InterruptedException {
        Random r = new Random();
       
        
        TimeUnit.SECONDS.sleep(Math.abs(r.nextInt(10)) + 1);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

        return "hello " + name + " " + sdf.format(new Date());
    }

}

package com.nbsaas.boot.controller.web;

import com.nbsaas.boot.rest.response.ResponseObject;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/state")
public class StateController {

    @Resource
    private CacheManager cacheManager;

    @RequestMapping("/cache")
    public ResponseObject<String> cache() {
        ResponseObject<String> result=new ResponseObject<>();
        result.setData(cacheManager.getCacheNames().stream().collect(Collectors.joining(",")));
        return result;
    }

    @RequestMapping("/cacheKeys")
    public ResponseObject<String> cacheKeys() {
        ResponseObject<String> result=new ResponseObject<>();
        result.setData(cacheManager.getCacheNames().stream().collect(Collectors.joining(",")));
        return result;
    }

    @Cacheable("myCache")
    @RequestMapping("/lastTime")
    public ResponseObject<String> lastTime() {
        ResponseObject<String> result=new ResponseObject<>();
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        result.setData(format.format(new Date()));
        return result;
    }
}

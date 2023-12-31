package com.nbsaas.boot.controller.system;

import com.nbsaas.boot.rest.annotations.*;
import com.nbsaas.boot.rest.response.ListResponse;
import com.nbsaas.boot.rest.response.PageResponse;
import com.nbsaas.boot.rest.response.ResponseObject;
import com.nbsaas.boot.system.api.apis.ApplicationMenuApi;
import com.nbsaas.boot.system.api.domain.request.ApplicationMenuDataRequest;
import com.nbsaas.boot.system.api.domain.request.ApplicationMenuSearchRequest;
import com.nbsaas.boot.system.api.domain.response.ApplicationMenuResponse;
import com.nbsaas.boot.system.api.domain.simple.ApplicationMenuSimple;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
*  前端控制器
*/
@RequiresAuthentication
@RestController
@RequestMapping("/applicationMenu")
public class ApplicationMenuFrontController {


    @Resource
    private ApplicationMenuApi applicationMenuApi;


    @RequestMapping("/search")
   public PageResponse<ApplicationMenuSimple> search(ApplicationMenuSearchRequest request) {
        return applicationMenuApi.search(request);
    }

    @RequestMapping("/list")
    public ListResponse <ApplicationMenuSimple> list(ApplicationMenuSearchRequest request) {
        return applicationMenuApi.list(request);
    }

        /**
        * 添加数据
        *
        * @param request
        * @return
        */
    @CreateData
  @RequestMapping("/create")
   public ResponseObject<ApplicationMenuResponse> create(@Validated(AddOperator.class) ApplicationMenuDataRequest request) {
       return applicationMenuApi.create(request);
    }

    @UpdateData
    @RequestMapping("/update")
   public ResponseObject
    <ApplicationMenuResponse> update(@Validated(UpdateOperator.class) ApplicationMenuDataRequest request) {
         return applicationMenuApi.update(request);
    }

     @RequestMapping("/delete")
     public ResponseObject<?> delete(@Validated(DeleteOperator.class) ApplicationMenuDataRequest request) {
        return applicationMenuApi.delete(request);
    }

    @RequestMapping("/view")
    public ResponseObject <ApplicationMenuResponse> view(@Validated(ViewOperator.class) ApplicationMenuDataRequest request) {
         return applicationMenuApi.view(request);
    }
}

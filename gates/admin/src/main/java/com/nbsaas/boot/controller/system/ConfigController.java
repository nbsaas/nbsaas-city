package com.nbsaas.boot.controller.system;

import com.nbsaas.boot.business.config.SiteConfig;
import com.nbsaas.boot.config.api.apis.ConfigApi;
import com.nbsaas.boot.config.api.domain.request.ConfigDataRequest;
import com.nbsaas.boot.config.api.domain.request.ConfigSearchRequest;
import com.nbsaas.boot.config.api.domain.response.ConfigResponse;
import com.nbsaas.boot.config.api.domain.simple.ConfigSimple;
import com.nbsaas.boot.config.ext.apis.ConfigExtApi;
import com.nbsaas.boot.rest.annotations.*;
import com.nbsaas.boot.rest.response.ListResponse;
import com.nbsaas.boot.rest.response.PageResponse;
import com.nbsaas.boot.rest.response.ResponseObject;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
*  对外控制器
*/
@RequiresAuthentication
@RestController
@RequestMapping("/config")
public class ConfigController {


      @Resource
      private ConfigApi configApi;

    @Resource
    private ConfigExtApi configExtApi;

    @RequestMapping("/info")
    public ResponseObject<SiteConfig> info() {
        return configExtApi.info(SiteConfig.class);
    }

    @RequestMapping("/configData")
    public ResponseObject<SiteConfig> config(SiteConfig config) {
        return configExtApi.configData(config);
    }
    @RequestMapping("/search")
    public PageResponse<ConfigSimple> search(ConfigSearchRequest request) {
         return configApi.search(request);
    }

    @RequestMapping("/list")
    public ListResponse<ConfigSimple> list(ConfigSearchRequest request) {
        return configApi.list(request);
    }

        /**
        * 添加数据
        *
        * @param request
        * @return
        */
        @CreateData
        @RequestMapping("/create")
        public ResponseObject
        <ConfigResponse> create(@Validated(AddOperator.class) ConfigDataRequest request) {
            return configApi.create(request);
        }

        @UpdateData
       @RequestMapping("/update")
       public ResponseObject<ConfigResponse> update(@Validated(UpdateOperator.class) ConfigDataRequest request) {
          return configApi.update(request);
       }

      @RequestMapping("/delete")
      public ResponseObject<?> delete(@Validated(DeleteOperator.class) ConfigDataRequest request) {
         return configApi.delete(request);
      }

       @RequestMapping("/view")
       public ResponseObject <ConfigResponse> view(@Validated(ViewOperator.class) ConfigDataRequest request) {
          return configApi.view(request);
       }
}
package com.nbsaas.boot.controller.system;

import com.nbsaas.boot.rest.annotations.*;
import com.nbsaas.boot.rest.response.ListResponse;
import com.nbsaas.boot.rest.response.PageResponse;
import com.nbsaas.boot.rest.response.ResponseObject;
import com.nbsaas.boot.system.api.apis.RecordLogApi;
import com.nbsaas.boot.system.api.domain.request.RecordLogDataRequest;
import com.nbsaas.boot.system.api.domain.request.RecordLogSearchRequest;
import com.nbsaas.boot.system.api.domain.response.RecordLogResponse;
import com.nbsaas.boot.system.api.domain.simple.RecordLogSimple;
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
@RequestMapping("/recordLog")
public class RecordLogController {


      @Resource
      private RecordLogApi recordLogApi;


    @RequestMapping("/search")
    public PageResponse<RecordLogSimple> search(RecordLogSearchRequest request) {
         return recordLogApi.search(request);
    }

    @RequestMapping("/list")
    public ListResponse<RecordLogSimple> list(RecordLogSearchRequest request) {
        return recordLogApi.list(request);
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
        <RecordLogResponse> create(@Validated(AddOperator.class) RecordLogDataRequest request) {
            return recordLogApi.create(request);
        }

        @UpdateData
       @RequestMapping("/update")
       public ResponseObject<RecordLogResponse> update(@Validated(UpdateOperator.class) RecordLogDataRequest request) {
          return recordLogApi.update(request);
       }

      @RequestMapping("/delete")
      public ResponseObject<?> delete(@Validated(DeleteOperator.class) RecordLogDataRequest request) {
         return recordLogApi.delete(request);
      }

       @RequestMapping("/view")
       public ResponseObject <RecordLogResponse> view(@Validated(ViewOperator.class) RecordLogDataRequest request) {
          return recordLogApi.view(request);
       }
}
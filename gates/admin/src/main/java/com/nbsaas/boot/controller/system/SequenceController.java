package com.nbsaas.boot.controller.system;

import com.nbsaas.boot.rest.annotations.*;
import com.nbsaas.boot.rest.response.ListResponse;
import com.nbsaas.boot.rest.response.PageResponse;
import com.nbsaas.boot.rest.response.ResponseObject;
import com.nbsaas.boot.system.api.apis.SequenceApi;
import com.nbsaas.boot.system.api.domain.request.SequenceDataRequest;
import com.nbsaas.boot.system.api.domain.request.SequenceSearchRequest;
import com.nbsaas.boot.system.api.domain.response.SequenceResponse;
import com.nbsaas.boot.system.api.domain.simple.SequenceSimple;
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
@RequestMapping("/sequence")
public class SequenceController {


      @Resource
      private SequenceApi sequenceApi;


    @RequestMapping("/search")
    public PageResponse<SequenceSimple> search(SequenceSearchRequest request) {
         return sequenceApi.search(request);
    }

    @RequestMapping("/list")
    public ListResponse<SequenceSimple> list(SequenceSearchRequest request) {
        return sequenceApi.list(request);
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
        <SequenceResponse> create(@Validated(AddOperator.class) SequenceDataRequest request) {
            return sequenceApi.create(request);
        }

        @UpdateData
       @RequestMapping("/update")
       public ResponseObject<SequenceResponse> update(@Validated(UpdateOperator.class) SequenceDataRequest request) {
          return sequenceApi.update(request);
       }

      @RequestMapping("/delete")
      public ResponseObject<?> delete(@Validated(DeleteOperator.class) SequenceDataRequest request) {
         return sequenceApi.delete(request);
      }

       @RequestMapping("/view")
       public ResponseObject <SequenceResponse> view(@Validated(ViewOperator.class) SequenceDataRequest request) {
          return sequenceApi.view(request);
       }
}
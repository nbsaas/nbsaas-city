package com.nbsaas.boot.controller.system;

import com.nbsaas.boot.rest.annotations.*;
import com.nbsaas.boot.rest.response.ListResponse;
import com.nbsaas.boot.rest.response.PageResponse;
import com.nbsaas.boot.rest.response.ResponseObject;
import com.nbsaas.boot.system.api.apis.MenuApi;
import com.nbsaas.boot.system.api.domain.request.MenuDataRequest;
import com.nbsaas.boot.system.api.domain.request.MenuSearchRequest;
import com.nbsaas.boot.system.api.domain.response.MenuResponse;
import com.nbsaas.boot.system.api.domain.simple.MenuSimple;
import com.nbsaas.boot.system.ext.apis.MenuExtApi;
import com.nbsaas.boot.system.ext.domain.request.UpdateRoleMenuRequest;
import com.nbsaas.boot.system.ext.domain.simple.MenuExtSimple;
import com.nbsaas.boot.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 *  对外控制器
 */
@RequiresAuthentication
@RestController
@RequestMapping("/menu")
public class MenuController {


    @Resource
    private MenuApi menuApi;




    @Resource
    private MenuExtApi menuExtApi;

    @RequestMapping("/tree")
    public ListResponse<MenuExtSimple> tree() {
        return menuExtApi.tree(UserUtils.user().getId(),1);
    }


    @RequestMapping("/root")
    public ListResponse<MenuExtSimple> root() {
        return menuExtApi.root();
    }


    @RequestMapping("/findByRole")
    public ListResponse<MenuExtSimple> findByRole(Long role) {
        return menuExtApi.findByRole(role);
    }


    @RequestMapping("/selectForPermission")
    public ListResponse<Long> selectForPermission(Long role) {
        return menuExtApi.selectForPermission(role);
    }

    @RequestMapping("/selectPermissionByUser")
    public ListResponse<String> selectPermissionByUser(Long userId) {
        return menuExtApi.selectPermissionByUser(userId);
    }

    @RequestMapping("/updateRoleMenus")
    public ResponseObject<?> updateRoleMenus(@RequestBody@Validated UpdateRoleMenuRequest request) {
        return menuExtApi.updateRoleMenus(request);
    }


    @RequestMapping("/search")
    public PageResponse<MenuSimple> search(MenuSearchRequest request) {
        return menuApi.search(request);
    }

    @RequestMapping("/list")
    public ListResponse<MenuSimple> list(MenuSearchRequest request) {
        return menuApi.list(request);
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
        <MenuResponse> create(@Validated(AddOperator.class) MenuDataRequest request) {
            return menuApi.create(request);
        }

        @UpdateData
       @RequestMapping("/update")
       public ResponseObject<MenuResponse> update(@Validated(UpdateOperator.class) MenuDataRequest request) {
          return menuApi.update(request);
       }

      @RequestMapping("/delete")
      public ResponseObject<?> delete(@Validated(DeleteOperator.class) MenuDataRequest request) {
         return menuApi.delete(request);
      }

       @RequestMapping("/view")
       public ResponseObject <MenuResponse> view(@Validated(ViewOperator.class) MenuDataRequest request) {
          return menuApi.view(request);
       }
}
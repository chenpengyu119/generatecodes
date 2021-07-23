package com.travelsky.basedata.controller;

import com.travelsky.basedata.validate.AddGroup;
import com.travelsky.basedata.validate.UpdateGroup;
import com.travelsky.basedata.dto.${class_name}Dto;
import com.travelsky.basedata.service.${class_name}Service;
import com.travelsky.basedata.service.manger.CommonServiceManger;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;
import java.util.Set;


@Validated
@RestController
@RequestMapping("/${object_name}")
@Api(tags = "${key_annotation}基础信息维护")
public class ${class_name}Controller {

    @Autowired
    ${class_name}Service ${object_name}Service;

    @Autowired
    CommonServiceManger commonServiceManger;

    @ApiOperation(value = "获取全部${key_annotation}信息", responseReference = "${key_annotation}信息列表")
    @GetMapping("/findAll")
    public List<${class_name}Dto> find${class_name}s() {
        return ${object_name}Service.getAll${class_name}s();
    }

    @ApiOperation(value = "根据id主键获取${key_annotation}信息", responseReference = "${key_annotation}信息")
    @GetMapping("/getById")
    public ${class_name}Dto get${class_name}ById(@ApiParam(value ="唯一编号", required = true)
                                          @RequestParam("id") @NotNull Long id) {
        return ${object_name}Service.get${class_name}ById(id);
    }

    @ApiOperation(value = "新增${key_annotation}信息")
    @PostMapping("/add")
    public void add${class_name}(@ApiParam(value = "新增${key_annotation}基础信息", required = true)
                           @Validated(AddGroup.class) @RequestBody ${class_name}Dto ${object_name}Dto) {
        ${object_name}Service.add${class_name}(${object_name}Dto);
    }

    @ApiOperation(value = "修改${key_annotation}基础信息")
    @PutMapping("/update")
    public void update${class_name}(@ApiParam(value = "修改${key_annotation}基础信息", required = true)
                                @Validated(UpdateGroup.class) @RequestBody ${class_name}Dto ${object_name}Dto) {
        ${object_name}Service.update${class_name}(${object_name}Dto);
    }

    @ApiOperation(value = "根据id主键删除${key_annotation}基础信息")
    @DeleteMapping("/deleteById")
    public void delete${class_name}ById(@ApiParam(value ="主键", required = true)
                              @RequestParam("id") @NotNull Long id) {
        ${object_name}Service.delete${class_name}ById(id);
    }

    @ApiOperation(value = "批量删除${key_annotation}基础信息")
    @DeleteMapping("/deleteAllByIds")
    public void delete${class_name}AllByIds(@ApiParam(value ="主键列表", required = true)
    @RequestParam("idList") @Size(max = 50,min = 1) Set<Long> idList) {
        commonServiceManger.batchDelete(${object_name}Service::delete${class_name}ById, idList);
    }

}

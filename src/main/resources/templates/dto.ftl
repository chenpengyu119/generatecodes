package com.travelsky.basedata.model.dto;

import com.travelsky.basedata.validate.AddGroup;
import com.travelsky.basedata.validate.UpdateGroup;
import com.taocares.commons.beans.annotation.Mapping;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * ${key_annotation}信息
 *
 * @author ${author}
 * @since ${date}
 */
@Getter
@Setter
@ApiModel("${key_annotation}信息")
public class ${class_name}Dto implements Serializable {
    private static final long serialVersionUID = 1L;

    <#if model_column?exists>
    <#list model_column as model>
    <#if model.propertyName == 'id'>
    /**
     * 主键
     */
    @NotNull(groups = {UpdateGroup.class}, message = "${model.columnComment}不能为空")
    @ApiModelProperty("主键")
    private ${model.classType} ${model.propertyName};

    </#if>
    <#if model.propertyName != 'id' && model.propertyName != 'version' && model.propertyName != 'delflag'>
    /**
     * ${model.columnComment}
     */
    <#if model.nullable = 'false'>
    <#if model.classType = 'String'>
    <#if model.propertyName = 'unicode'>
    @NotEmpty(groups = {UpdateGroup.class}, message = "${model.columnComment}不能为空")
    <#else>
    @NotEmpty(groups = {AddGroup.class, UpdateGroup.class}, message = "${model.columnComment}不能为空")
    </#if>
    <#elseif model.classType = 'Date'>
    @NotEmpty(groups = {UpdateGroup.class}, message = "${model.columnComment}不能为空")
    <#else>
    @NotNull(groups = {AddGroup.class, UpdateGroup.class}, message = "${model.columnComment}不能为空")
    </#if>
    </#if>
    <#if model.nullable = 'false' && model.propertyName = 'unicode'>
    @ApiModelProperty("唯一编码")
    <#elseif model.nullable = 'false'>
    @ApiModelProperty(value = "${model.columnComment}", required = true)
    <#else>
    @ApiModelProperty("${model.columnComment}")
    </#if>
    <#if model.classType = 'Date'>
    @Mapping(datePattern = "yyyy-MM-dd")
    private String ${model.propertyName};

    <#else>
    private ${model.classType} ${model.propertyName};

    </#if>
    </#if>
    </#list>
    </#if>
}

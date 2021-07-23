package com.travelsky.basedata.event.body;

import lombok.Data;

/**
 * ${key_annotation}消息体
 *
 * @author ${author}
 * @since ${date}
 */
@Data
public class ${class_name}MsgBody {

    <#if model_column?exists>
    <#list model_column as model>
    <#if model.classType != 'Date'>
    <#if model.propertyName != 'delflag' && model.propertyName != 'version' >
    /**
     * ${model.columnComment}
     */
    private ${model.classType} ${model.propertyName};

    </#if>
    <#else>
    /**
     * ${model.columnComment}
     */
    private String ${model.propertyName};

    </#if>
    </#list>
    </#if>
}


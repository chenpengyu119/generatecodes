package com.travelsky.basedata.service;

import com.travelsky.basedata.common.util.UUIDGenerator;
import com.travelsky.basedata.model.dto.${class_name}Dto;
import com.travelsky.basedata.model.entity.${class_name};
import com.travelsky.basedata.repository.${class_name}Repository;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * ${key_annotation}service测试
 *
 * @author ${author}
 * @since ${date}
 */
public class ${class_name}ServiceTests extends BaseServiceTest {

    @Autowired
    ${class_name}Service ${object_name}Service;
    
    @Autowired
    private ${class_name}Repository ${object_name}Repository;


    @Before
    public void before() {
      
    }
    
    /**
     * 查询所有${key_annotation}信息
     */
    @Test 
    public void getAll${class_name}sTests(){
        System.out.println(${object_name}Service.getAll${class_name}s());
    }
    
    /**
     * 根据唯一编码查询${key_annotation}信息
     */
    @Test 
    public void get${class_name}ByIdTests(){
        System.out.println(${object_name}Service.get${class_name}ById(unicode));
    }
    
    /**
     * 新增${key_annotation}
     */
    @Test  
    public void add${class_name}Tests(){
        String unicode = UUIDGenerator.generateShortUuid();
        ${class_name}Dto ${object_name}Dto = new ${class_name}Dto();  
        <#if model_column?exists>
        <#list model_column as model>
        <#if model.propertyName = 'unicode'>
        ${object_name}Dto.setUnicode(unicode);
        </#if>
        <#if model.propertyName = 'deflag'>
        ${object_name}.setDelflag(false);
        </#if>
        <#if model.propertyName != 'id' && model.propertyName != 'version' && model.propertyName != 'delflag' && model.propertyName != 'unicode'>
        <#if model.nullable = 'false' && model.classType = 'String'>
        ${object_name}Dto.set${model.methodName}(unicode);
        </#if>    
        <#if model.nullable = 'false' && model.classType = 'Boolean'>
        ${object_name}Dto.set${model.methodName}(false);
        </#if>
        <#if model.nullable = 'false' && model.classType = 'Long'>
        ${object_name}Dto.set${model.methodName}(1L);
        </#if>    
        </#if>
        </#list>
        </#if>
        ${object_name}Service.add${class_name}(${object_name}Dto);
    }

    /**
     * 更新${key_annotation}
     */
    @Test  
    public void update${class_name}Tests(){
        String unicode = UUIDGenerator.generateShortUuid();
        ${class_name}Dto ${object_name}Dto = new ${class_name}Dto();  
        <#if model_column?exists>
        <#list model_column as model>
        <#if model.propertyName = 'unicode'>
        ${object_name}Dto.setUnicode(unicode);
        </#if>
        <#if model.propertyName = 'deflag'>
        ${object_name}.setDelflag(false);
        </#if>
        <#if model.propertyName != 'id' && model.propertyName != 'version' && model.propertyName != 'delflag' && model.propertyName != 'unicode'>
        <#if model.nullable = 'false' && model.classType = 'String'>
        ${object_name}Dto.set${model.methodName}(unicode);
        </#if>    
        <#if model.nullable = 'false' && model.classType = 'Boolean'>
        ${object_name}Dto.set${model.methodName}(false);
        </#if>
        <#if model.nullable = 'false' && model.classType = 'Long'>
        ${object_name}Dto.set${model.methodName}(1L);
        </#if>    
        </#if>
        </#list>
        </#if>
        ${object_name}Service.update${class_name}(${object_name}Dto);
    }

    /**
     * 根据唯一编码删除${key_annotation}
     */
    @Test  
    public void delete${class_name}ByUnicodeTests(){
        String unicode = UUIDGenerator.generateShortUuid();
        ${class_name} ${object_name} = new ${class_name}();
        <#if model_column?exists>
        <#list model_column as model>
        <#if model.propertyName = 'unicode'>
        ${object_name}.setUnicode(unicode);
        </#if>
        <#if model.propertyName = 'deflag'>
        ${object_name}.setDelflag(false);
        </#if>
        <#if model.propertyName != 'id' && model.propertyName != 'version' && model.propertyName != 'deflag' && model.propertyName != 'unicode'>
        <#if model.nullable = 'false' && model.classType = 'String'>
        ${object_name}.set${model.methodName}(unicode);
        </#if>    
        <#if model.nullable = 'false' && model.classType = 'Boolean'>
        ${object_name}.set${model.methodName}(false);
        </#if>
        <#if model.nullable = 'false' && model.classType = 'Long'>
        ${object_name}.set${model.methodName}(1L);
        </#if>    
        </#if>
        </#list>
        </#if>
        ${class_name} entity = ${object_name}Repository.save(${object_name});
        ${object_name}Service.delete${class_name}ByUnicode(entity.getUnicode());
    }
    
}

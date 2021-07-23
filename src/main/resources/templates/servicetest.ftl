package com.travelsky.basedata.service;

import com.taocares.commons.beans.BeanUtils;
import com.taocares.commons.util.CollectionUtils;
import com.travelsky.basedata.message.EventSender;
import com.travelsky.basedata.model.dto.${class_name}Dto;
import com.travelsky.basedata.model.entity.${class_name};
import com.travelsky.basedata.repository.${class_name}Repository;
import com.travelsky.basedata.service.data.${class_name}DataService;
import com.travelsky.basedata.service.impl.${class_name}ServiceImpl;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Spy;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.reflect.Whitebox;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

public class ${class_name}ServiceTest extends BaseServiceTest {

    private ${class_name} ${object_name};

    private ${class_name}Dto ${object_name}Dto;

    @InjectMocks
    ${class_name}ServiceImpl ${object_name}Service;

    @Mock
    ${class_name}Repository ${object_name}Repository;

    @Spy
    ${class_name}DataService ${object_name}DataService;

    @Mock
    EventSender eventSender;

    @Before
    public void setUp(){
        ${object_name} = new ${class_name}();
        <#if model_column?exists>
        <#list model_column as model>
        <#if model.propertyName != 'version'>
        <#if model.classType = 'String'>
        ${object_name}.set${model.methodName}("1");
        <#else><#if model.classType = 'Boolean'>
        ${object_name}.set${model.methodName}(false);
        <#else>
        ${object_name}.set${model.methodName}(1L);
        </#if>
        </#if>
        </#if>
        </#list>
        </#if>
        Whitebox.setInternalState(${object_name}DataService,"${object_name}Repository", ${object_name}Repository);
        Whitebox.setInternalState(${object_name}Service,"${object_name}DataService", ${object_name}DataService);
        Optional<${class_name}> entity = Optional.of(${object_name});
        when(${object_name}Repository.findById(1L)).thenReturn(entity);

        ${object_name}Dto = new ${class_name}Dto();
        BeanUtils.copyProperties(${object_name},${object_name}Dto);
    }

    @Test
    public void getAll${class_name}sTest(){
        List<${class_name}> list = Arrays.asList(${object_name});
        when(${object_name}Repository.findAll()).thenReturn(list);
        List<${class_name}Dto> result = ${object_name}Service.getAll${class_name}s();
        Assert.assertFalse(CollectionUtils.isEmpty(result));
        Assert.assertEquals(result.get(0).getId(), Long.valueOf(1L));
        verify(${object_name}Repository,times(1)).findAll();
    }

    @Test
    public void get${class_name}ByIdTest(){
        ${class_name}Dto ${object_name}Dto = ${object_name}Service.get${class_name}ById(1L);
        Assert.assertNotNull(${object_name}Dto);
        Assert.assertEquals(${object_name}Dto.getId(), Long.valueOf(1L));
        verify(${object_name}Repository,times(1)).findById(1L);
    }

    //新增机场信息
    @Test
    public void add${class_name}Test() {
        when(${object_name}Repository.save(any(${class_name}.class))).thenReturn(${object_name});

        ${object_name}Service.add${class_name}(${object_name}Dto);
        verify(${object_name}Repository,times(1)).save(any(${class_name}.class));
    }

    //更新机场信息
    @Test
    public void update${class_name}Test() {
        ${object_name}Service.update${class_name}(${object_name}Dto);
        verify(${object_name}Repository,times(1)).findById(1L);
        verify(${object_name}Repository,times(1)).save(any(${class_name}.class));
    }

    @Test
    public void delete${class_name}Test() {
        ${object_name}Service.delete${class_name}ById(1L);
        verify(${object_name}Repository,times(1)).findById(1L);
        verify(${object_name}Repository,times(1)).delete(any(${class_name}.class));
    }

}

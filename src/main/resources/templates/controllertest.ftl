package com.travelsky.basedata.controller;

import com.google.gson.Gson;
import com.taocares.commons.exception.GlobalExceptionHandler;
import com.taocares.commons.exception.data.ResourceNotFoundException;
import com.travelsky.basedata.aspect.LocalExceptionAspect;
import com.travelsky.basedata.common.util.ExceptionMessageFormat;
import com.travelsky.basedata.model.dto.${class_name}Dto;
import com.travelsky.basedata.service.${class_name}Service;
import com.travelsky.basedata.service.manger.CommonServiceManger;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.Spy;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.util.Arrays;
import java.util.List;

import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;


/**
 * ${key_annotation}Controller测试
 *
 * @author ${author}
 * @since ${date}
 */
public class ${class_name}ControllerTest {

    private MockMvc mockMvc;

    @InjectMocks
    private ${class_name}Controller ${object_name}Controller;

    @Mock
    private ${class_name}Service ${object_name}Service;

    @Spy
    private CommonServiceManger commonServiceManger;

    private ${class_name}Dto ${object_name}Dto;

    private Gson gson = new Gson();

    @Before
    public void before() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(${object_name}Controller)
                .setControllerAdvice(new LocalExceptionAspect(), new GlobalExceptionHandler())
                .build();
        ${object_name}Dto = new ${class_name}Dto();
        <#if model_column?exists>
        <#list model_column as model>
        <#if model.propertyName != 'version' && model.propertyName != 'delflag' && model.propertyName != 'id'>
        <#if model.classType = 'String'>
        ${object_name}Dto.set${model.methodName}("1");
        <#else><#if model.classType = 'Boolean'>
        ${object_name}Dto.set${model.methodName}(true);
        <#else>
        ${object_name}Dto.set${model.methodName}(1L);
        </#if>
        </#if>
        </#if>
        </#list>
        </#if>
    }

    @Test
    public void find${class_name}sTest() throws Exception {
        List<${class_name}Dto> list = Arrays.asList(${object_name}Dto);
        when(${object_name}Service.getAll${class_name}s()).thenReturn(list);
        MvcResult result= mockMvc.perform(get("/${object_name}/findAll")
                .accept(MediaType.APPLICATION_JSON))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(${object_name}Service,times(1)).getAll${class_name}s();
    }

    @Test
    public void get${class_name}ByIdTest() throws Exception {
        when(${object_name}Service.get${class_name}ById(anyLong())).thenReturn(${object_name}Dto);
        MvcResult result= mockMvc.perform(get("/${object_name}/getById?id=1")
                .accept(MediaType.APPLICATION_JSON))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(${object_name}Service,times(1)).get${class_name}ById(anyLong());
    }

    @Test
    public void add${class_name}Test() throws Exception {
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.post("/${object_name}/add")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON).content(gson.toJson(${object_name}Dto)))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(${object_name}Service,times(1)).add${class_name}(any(${class_name}Dto.class));
    }

    @Test
    public void update${class_name}Test() throws Exception {
        ${object_name}Dto.setId(1L);
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.put("/${object_name}/update")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON).content(gson.toJson(${object_name}Dto)))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(${object_name}Service,times(1)).update${class_name}(any(${class_name}Dto.class));
    }

    @Test
    public void delete${class_name}Test() throws Exception {
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.delete("/${object_name}/deleteById?id=1")
                .accept(MediaType.APPLICATION_JSON))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(${object_name}Service,times(1)).delete${class_name}ById(1L);
    }

    //批量删除全部成功情况
    @Test
    public void delete${class_name}AllByIdTest1() throws Exception {
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.delete("/${object_name}/deleteAllByIds?idList=1,2")
                .contentType(MediaType.APPLICATION_JSON))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);

    }
    //批量删除部分成功情况
    @Test
    public void delete${class_name}AllByIdTest2() throws Exception {
        doThrow(new ResourceNotFoundException(ExceptionMessageFormat.idNotFoundMessage(3L))).when(${object_name}Service).delete${class_name}ById(3L);
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.delete("/${object_name}/deleteAllByIds?idList=1,3")
                .contentType(MediaType.APPLICATION_JSON))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(statusCode, 206);
    }
}

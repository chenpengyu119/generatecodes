package com.travelsky.basedata.controller;

import com.google.gson.Gson;
import com.taocares.commons.exception.GlobalExceptionHandler;
import com.taocares.commons.exception.data.ResourceNotFoundException;
import com.travelsky.basedata.aspect.LocalExceptionAspect;
import com.travelsky.basedata.common.util.ExceptionMessageFormat;
import com.travelsky.basedata.model.dto.ResDispatchSpeedDto;
import com.travelsky.basedata.service.ResDispatchSpeedService;
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
 * Controller测试
 *
 * @author lvziqiang
 * @since 2021年06月07日14:48:23
 */
public class ResDispatchSpeedControllerTest {

    private MockMvc mockMvc;

    @InjectMocks
    private ResDispatchSpeedController speedController;

    @Mock
    private ResDispatchSpeedService speedService;

    @Spy
    private CommonServiceManger commonServiceManger;

    private ResDispatchSpeedDto speedDto;

    private Gson gson = new Gson();

    @Before
    public void before() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(speedController)
                .setControllerAdvice(new LocalExceptionAspect(), new GlobalExceptionHandler())
                .build();
        speedDto = new ResDispatchSpeedDto();
        speedDto.setSpeed(1L);
        speedDto.setDispatchId("1");
    }

    @Test
    public void findResDispatchSpeedsTest() throws Exception {
        List<ResDispatchSpeedDto> list = Arrays.asList(speedDto);
        when(speedService.getAllResDispatchSpeeds()).thenReturn(list);
        MvcResult result= mockMvc.perform(get("/speed/findAll")
                .accept(MediaType.APPLICATION_JSON))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(speedService,times(1)).getAllResDispatchSpeeds();
    }

    @Test
    public void getResDispatchSpeedByIdTest() throws Exception {
        when(speedService.getResDispatchSpeedById(anyLong())).thenReturn(speedDto);
        MvcResult result= mockMvc.perform(get("/speed/getById?id=1")
                .accept(MediaType.APPLICATION_JSON))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(speedService,times(1)).getResDispatchSpeedById(anyLong());
    }

    @Test
    public void addResDispatchSpeedTest() throws Exception {
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.post("/speed/add")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON).content(gson.toJson(speedDto)))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(speedService,times(1)).addResDispatchSpeed(any(ResDispatchSpeedDto.class));
    }

    @Test
    public void updateResDispatchSpeedTest() throws Exception {
        speedDto.setId(1L);
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.put("/speed/update")
                .accept(MediaType.APPLICATION_JSON)
                .contentType(MediaType.APPLICATION_JSON).content(gson.toJson(speedDto)))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(speedService,times(1)).updateResDispatchSpeed(any(ResDispatchSpeedDto.class));
    }

    @Test
    public void deleteResDispatchSpeedTest() throws Exception {
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.delete("/speed/deleteById?id=1")
                .accept(MediaType.APPLICATION_JSON))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(200, statusCode);
        verify(speedService,times(1)).deleteResDispatchSpeedById(1L);
    }

    //批量删除全部成功情况
    @Test
    public void deleteResDispatchSpeedAllByIdTest1() throws Exception {
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.delete("/speed/deleteAllByIds?idList=1,2")
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
    public void deleteResDispatchSpeedAllByIdTest2() throws Exception {
        doThrow(new ResourceNotFoundException(ExceptionMessageFormat.idNotFoundMessage(3L))).when(speedService).deleteResDispatchSpeedById(3L);
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.delete("/speed/deleteAllByIds?idList=1,3")
                .contentType(MediaType.APPLICATION_JSON))
                .andReturn();
        int statusCode = result.getResponse().getStatus();
        String content = result.getResponse().getContentAsString();
        System.out.println("statusCode: "+statusCode);
        System.out.println("返回结果 content: "+content);
        Assert.assertEquals(statusCode, 206);
    }
}

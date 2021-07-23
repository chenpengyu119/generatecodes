package com.travelsky.basedata.service;

import com.taocares.commons.beans.BeanUtils;
import com.taocares.commons.util.CollectionUtils;
import com.travelsky.basedata.message.EventSender;
import com.travelsky.basedata.model.dto.ResDispatchSpeedDto;
import com.travelsky.basedata.model.entity.ResDispatchSpeed;
import com.travelsky.basedata.repository.ResDispatchSpeedRepository;
import com.travelsky.basedata.service.data.ResDispatchSpeedDataService;
import com.travelsky.basedata.service.impl.ResDispatchSpeedServiceImpl;
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

public class ResDispatchSpeedServiceTest extends BaseServiceTest {

    private ResDispatchSpeed speed;

    private ResDispatchSpeedDto speedDto;

    @InjectMocks
    ResDispatchSpeedServiceImpl speedService;

    @Mock
    ResDispatchSpeedRepository speedRepository;

    @Spy
    ResDispatchSpeedDataService speedDataService;

    @Mock
    EventSender eventSender;

    @Before
    public void setUp(){
        speed = new ResDispatchSpeed();
        speed.setId("1");
        speed.setSpeed(1L);
        speed.setDispatchId("1");
        Whitebox.setInternalState(speedDataService,"speedRepository", speedRepository);
        Whitebox.setInternalState(speedService,"speedDataService", speedDataService);
        Optional<ResDispatchSpeed> entity = Optional.of(speed);
        when(speedRepository.findById(1L)).thenReturn(entity);

        speedDto = new ResDispatchSpeedDto();
        BeanUtils.copyProperties(speed,speedDto);
    }

    @Test
    public void getAllResDispatchSpeedsTest(){
        List<ResDispatchSpeed> list = Arrays.asList(speed);
        when(speedRepository.findAll()).thenReturn(list);
        List<ResDispatchSpeedDto> result = speedService.getAllResDispatchSpeeds();
        Assert.assertFalse(CollectionUtils.isEmpty(result));
        Assert.assertEquals(result.get(0).getId(), Long.valueOf(1L));
        verify(speedRepository,times(1)).findAll();
    }

    @Test
    public void getResDispatchSpeedByIdTest(){
        ResDispatchSpeedDto speedDto = speedService.getResDispatchSpeedById(1L);
        Assert.assertNotNull(speedDto);
        Assert.assertEquals(speedDto.getId(), Long.valueOf(1L));
        verify(speedRepository,times(1)).findById(1L);
    }

    //新增机场信息
    @Test
    public void addResDispatchSpeedTest() {
        when(speedRepository.save(any(ResDispatchSpeed.class))).thenReturn(speed);

        speedService.addResDispatchSpeed(speedDto);
        verify(speedRepository,times(1)).save(any(ResDispatchSpeed.class));
    }

    //更新机场信息
    @Test
    public void updateResDispatchSpeedTest() {
        speedService.updateResDispatchSpeed(speedDto);
        verify(speedRepository,times(1)).findById(1L);
        verify(speedRepository,times(1)).save(any(ResDispatchSpeed.class));
    }

    @Test
    public void deleteResDispatchSpeedTest() {
        speedService.deleteResDispatchSpeedById(1L);
        verify(speedRepository,times(1)).findById(1L);
        verify(speedRepository,times(1)).delete(any(ResDispatchSpeed.class));
    }

}

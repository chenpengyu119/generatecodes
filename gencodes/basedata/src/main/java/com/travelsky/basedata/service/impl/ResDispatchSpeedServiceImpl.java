package com.travelsky.basedata.service.impl;

import com.taocares.commons.beans.BeanUtils;
import com.taocares.commons.exception.data.ResourceNotFoundException;
import com.taocares.commons.util.CollectionUtils;
import com.travelsky.basedata.builder.ResDispatchSpeedEventBuilder;
import com.travelsky.basedata.common.util.ExceptionMessageFormat;
import com.travelsky.basedata.message.EventSender;
import com.travelsky.basedata.dto.ResDispatchSpeedDto;
import com.travelsky.basedata.model.entity.ResDispatchSpeed;
import com.travelsky.basedata.repository.ResDispatchSpeedRepository;
import com.travelsky.basedata.service.ResDispatchSpeedService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * 数据操作
 *
 * @author lvziqiang
 * @since 2021年06月07日14:48:23
 */
@Slf4j
@Service
@Transactional(readOnly = true)
public class ResDispatchSpeedServiceImpl implements ResDispatchSpeedService{

    //自动装配
    @Autowired
    //声明属性
    private ResDispatchSpeedRepository speedRepository;

    @Autowired
    private EventSender eventSender;

    /**
     * 查询所有信息
     * @return 
     */
    @Override
    public List<ResDispatchSpeedDto> getAllResDispatchSpeeds(){
        List<ResDispatchSpeedDto> resultList = new ArrayList<>();
        //查询所有数据
        List<ResDispatchSpeed> list = speedRepository.findAll();
        //如果查询到数据，进行数据转换并返回
        if(!CollectionUtils.isEmpty(list)) {
            //实体和Dto之间的互相转换
            resultList = BeanUtils.copyProperties(list, ResDispatchSpeedDto.class);
        }
        // 返回结果集
        return resultList;
    }

    /**
     * 根据id主键查询信息
     * @param id 主键
     * @return 
     */
    @Override
    public ResDispatchSpeedDto getResDispatchSpeedById(Long id){
        //根据id主键从数据库查询相关数据
        Optional<ResDispatchSpeed> speed = speedRepository.findById(id);
        if(!speed.isPresent()){
            //抛出资源没有找到的异常
            throw new ResourceNotFoundException(ExceptionMessageFormat.idNotFoundMessage(id));
        }
        //获取实体
        return BeanUtils.copyProperties(speed.get(), ResDispatchSpeedDto.class);
    }

    /**
     * 新增
     * @param speedDto 
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void addResDispatchSpeed(ResDispatchSpeedDto speedDto){
        //Dto和实体之间的转换
        ResDispatchSpeed speed = BeanUtils.copyProperties(speedDto, ResDispatchSpeed.class);

        //数据保存
        speedRepository.save(speed);
        //创建事件构造器对象
        ResDispatchSpeedEventBuilder builder = new ResDispatchSpeedEventBuilder();
        //事件发送者发送新增事件
        eventSender.sendDefaultMessage(builder.buildAddEvent(speed));
    }

    /**
     * 更新
     * @param speedDto 
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void updateResDispatchSpeed(ResDispatchSpeedDto speedDto){
        //根据id主键从数据库查询相关数据
        Optional<ResDispatchSpeed> speed = speedRepository.findById(speedDto.getId());
        if(!speed.isPresent()){
            //抛出资源没有找到的异常
            throw new ResourceNotFoundException(ExceptionMessageFormat.idNotFoundMessage(speedDto.getId()));
        }
        //获取相应实体
        ResDispatchSpeed entity = speed.get();
        //对象copy赋值
        BeanUtils.copyProperties(speedDto, entity);
        //数据更新
        speedRepository.save(entity);
        //创建事件构造器对象
        ResDispatchSpeedEventBuilder builder = new ResDispatchSpeedEventBuilder();
        //事件发送者发送更新事件
        eventSender.sendDefaultMessage(builder.buildUpdateEvent(entity));
    }

    /**
     * 根据id主键删除
     * @param id 主键
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void deleteResDispatchSpeedById(Long id){
        //根据id主键从数据库查询相关数据
        Optional<ResDispatchSpeed> speed = speedRepository.findById(id);
        if(!speed.isPresent()){
            //抛出资源没有找到的异常
            throw new ResourceNotFoundException(ExceptionMessageFormat.idNotFoundMessage(id));
        }
        //获取相应实体
        ResDispatchSpeed entity = speed.get();
        //数据删除
        speedRepository.delete(entity);
        //创建事件构造器对象
        ResDispatchSpeedEventBuilder builder = new ResDispatchSpeedEventBuilder();
        //事件发送者发送更新事件
        eventSender.sendDefaultMessage(builder.buildUpdateEvent(entity));
    }

}

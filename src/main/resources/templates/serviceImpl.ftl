package com.travelsky.basedata.service.impl;

import com.taocares.commons.beans.BeanUtils;
import com.taocares.commons.exception.data.ResourceNotFoundException;
import com.taocares.commons.util.CollectionUtils;
import com.travelsky.basedata.builder.${class_name}EventBuilder;
import com.travelsky.basedata.common.util.ExceptionMessageFormat;
import com.travelsky.basedata.message.EventSender;
import com.travelsky.basedata.dto.${class_name}Dto;
import com.travelsky.basedata.model.entity.${class_name};
import com.travelsky.basedata.repository.${class_name}Repository;
import com.travelsky.basedata.service.${class_name}Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * ${key_annotation}数据操作
 *
 * @author ${author}
 * @since ${date}
 */
@Slf4j
@Service
@Transactional(readOnly = true)
public class ${class_name}ServiceImpl implements ${class_name}Service{

    //自动装配
    @Autowired
    //声明属性
    private ${class_name}Repository ${object_name}Repository;

    @Autowired
    private EventSender eventSender;

    /**
     * 查询所有${key_annotation}信息
     * @return ${key_annotation}
     */
    @Override
    public List<${class_name}Dto> getAll${class_name}s(){
        List<${class_name}Dto> resultList = new ArrayList<>();
        //查询所有数据
        List<${class_name}> list = ${object_name}Repository.findAll();
        //如果查询到数据，进行数据转换并返回
        if(!CollectionUtils.isEmpty(list)) {
            //实体和Dto之间的互相转换
            resultList = BeanUtils.copyProperties(list, ${class_name}Dto.class);
        }
        // 返回结果集
        return resultList;
    }

    /**
     * 根据id主键查询${key_annotation}信息
     * @param id 主键
     * @return ${key_annotation}
     */
    @Override
    public ${class_name}Dto get${class_name}ById(Long id){
        //根据id主键从数据库查询相关数据
        Optional<${class_name}> ${object_name} = ${object_name}Repository.findById(id);
        if(!${object_name}.isPresent()){
            //抛出资源没有找到的异常
            throw new ResourceNotFoundException(ExceptionMessageFormat.idNotFoundMessage(id));
        }
        //获取实体
        return BeanUtils.copyProperties(${object_name}.get(), ${class_name}Dto.class);
    }

    /**
     * 新增${key_annotation}
     * @param ${object_name}Dto ${key_annotation}
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void add${class_name}(${class_name}Dto ${object_name}Dto){
        //Dto和实体之间的转换
        ${class_name} ${object_name} = BeanUtils.copyProperties(${object_name}Dto, ${class_name}.class);

        //数据保存
        ${object_name}Repository.save(${object_name});
        //创建事件构造器对象
        ${class_name}EventBuilder builder = new ${class_name}EventBuilder();
        //事件发送者发送新增事件
        eventSender.sendDefaultMessage(builder.buildAddEvent(${object_name}));
    }

    /**
     * 更新${key_annotation}
     * @param ${object_name}Dto ${key_annotation}
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void update${class_name}(${class_name}Dto ${object_name}Dto){
        //根据id主键从数据库查询相关数据
        Optional<${class_name}> ${object_name} = ${object_name}Repository.findById(${object_name}Dto.getId());
        if(!${object_name}.isPresent()){
            //抛出资源没有找到的异常
            throw new ResourceNotFoundException(ExceptionMessageFormat.idNotFoundMessage(${object_name}Dto.getId()));
        }
        //获取相应实体
        ${class_name} entity = ${object_name}.get();
        //对象copy赋值
        BeanUtils.copyProperties(${object_name}Dto, entity);
        //数据更新
        ${object_name}Repository.save(entity);
        //创建事件构造器对象
        ${class_name}EventBuilder builder = new ${class_name}EventBuilder();
        //事件发送者发送更新事件
        eventSender.sendDefaultMessage(builder.buildUpdateEvent(entity));
    }

    /**
     * 根据id主键删除${key_annotation}
     * @param id 主键
     */
    @Override
    @Transactional(readOnly = false, rollbackFor = Exception.class)
    public void delete${class_name}ById(Long id){
        //根据id主键从数据库查询相关数据
        Optional<${class_name}> ${object_name} = ${object_name}Repository.findById(id);
        if(!${object_name}.isPresent()){
            //抛出资源没有找到的异常
            throw new ResourceNotFoundException(ExceptionMessageFormat.idNotFoundMessage(id));
        }
        //获取相应实体
        ${class_name} entity = ${object_name}.get();
        //数据删除
        ${object_name}Repository.delete(entity);
        //创建事件构造器对象
        ${class_name}EventBuilder builder = new ${class_name}EventBuilder();
        //事件发送者发送更新事件
        eventSender.sendDefaultMessage(builder.buildUpdateEvent(entity));
    }

}

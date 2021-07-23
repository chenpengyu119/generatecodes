package com.travelsky.basedata.service.data;

import com.taocares.commons.beans.BeanUtils;
import com.travelsky.basedata.model.dto.${class_name}Dto;
import com.travelsky.basedata.model.entity.${class_name};
import com.travelsky.basedata.repository.${class_name}Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

<#if model_column?exists>
<#list model_column as model>
<#if model.propertyName = 'delflag' || model.propertyName = 'enable'>

import java.util.List;
</#if>
</#list>
</#if>
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * ${key_annotation}数据操作
 *
 * @author ${author}
 * @since ${date}
 */
@Service
@CacheConfig(cacheNames = "travelsky.basedata.${class_name}Dto")
public class ${class_name}DataService {

    @Autowired
    private ${class_name}Repository ${object_name}Repository;

    /**
     * 根据id查询${key_annotation}信息
     * @param id
     * @return ${key_annotation}
     */
    @Cacheable(key = "#id")
    public Optional<${class_name}Dto> findById(Long id){
        Optional<${class_name}> ${object_name} = ${object_name}Repository.findById(id);
        return ${object_name}.map(naoms${class_name} -> BeanUtils.copyProperties(naoms${class_name}, ${class_name}Dto.class));
    }

    /**
     * 更新${key_annotation}信息
     * @param ${object_name} ${key_annotation}
     * @return ${key_annotation}对象
     */
    @CachePut(key = "#result.id")
    public ${class_name}Dto update(${class_name} ${object_name}) {
        ${object_name}Repository.save(${object_name});
        return BeanUtils.copyProperties(${object_name}, ${class_name}Dto.class);
    }

    /**
     * 删除${key_annotation}
     * @param ${object_name} ${key_annotation}
     * @return ${key_annotation}对象
     */
    @CacheEvict(key = "#${object_name}.id")
    public void delete(${class_name} ${object_name}) {
       ${object_name}Repository.delete(${object_name});
    }

}

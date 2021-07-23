package com.travelsky.basedata.repository;

import com.travelsky.basedata.model.entity.${class_name};
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.Optional;

/**
 * ${key_annotation}
 *
 * @author ${author}
 * @since ${date}
 */
public interface ${class_name}Repository extends JpaRepository<${class_name}, Long>, JpaSpecificationExecutor<${class_name}> {

    /**
     * 根据主键查询${key_annotation}信息
     * @param id 主键
     * @return ${key_annotation}
     */
    Optional<${class_name}> findById(Long id);

    <#if model_column?exists>
    <#list model_column as model>
    <#if model.propertyName = 'delflag'>
    /**
     * 根据id主键和删除标记位查询${key_annotation}信息
     * @param id 主键
     * @param delflag 逻辑删除标记位
     * @return ${key_annotation}
     */
    Optional<${class_name}> findByIdAndDelflag(Long id, Boolean delflag);

    /**
     * 根据逻辑删除标记位查询${key_annotation}信息
     * @param delflag 逻辑删除标记位
     * @return ${key_annotation}列表
     */
    List<${class_name}> findAllByDelflag(Boolean delflag);

    </#if>
    </#list>
    </#if>
    /**
     * 查询所有${key_annotation}信息
     * @return ${key_annotation}
     */
    List<${class_name}> findAll();

}

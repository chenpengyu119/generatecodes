package com.travelsky.basedata.service;

import com.travelsky.basedata.dto.${class_name}Dto;

import java.util.List;
/**
 * ${key_annotation}数据操作
 *
 * @author ${author}
 * @date ${date}
 */
public interface ${class_name}Service {

    /**
     * 查询所有${key_annotation}信息
     * @return ${key_annotation}
     */
    List<${class_name}Dto> getAll${class_name}s();

    /**
     * 根据id查询${key_annotation}信息
     * @param id 主键
     * @return ${key_annotation}
     */
    ${class_name}Dto get${class_name}ById(Long id);

    /**
     * 新增${key_annotation}
     * @param ${object_name}Dto ${key_annotation}
     */
    void add${class_name}(${class_name}Dto ${object_name}Dto);

    /**
     * 更新${key_annotation}
     * @param ${object_name}Dto ${key_annotation}
     */
    void update${class_name}(${class_name}Dto ${object_name}Dto);

    /**
     * 根据Id主键删除${key_annotation}
     * @param id 主键
     */
    void delete${class_name}ById(Long id);
}

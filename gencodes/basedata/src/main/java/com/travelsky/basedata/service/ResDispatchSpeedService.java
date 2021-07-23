package com.travelsky.basedata.service;

import com.travelsky.basedata.dto.ResDispatchSpeedDto;

import java.util.List;
/**
 * 数据操作
 *
 * @author lvziqiang
 * @date 2021年06月07日14:48:23
 */
public interface ResDispatchSpeedService {

    /**
     * 查询所有信息
     * @return 
     */
    List<ResDispatchSpeedDto> getAllResDispatchSpeeds();

    /**
     * 根据id查询信息
     * @param id 主键
     * @return 
     */
    ResDispatchSpeedDto getResDispatchSpeedById(Long id);

    /**
     * 新增
     * @param speedDto 
     */
    void addResDispatchSpeed(ResDispatchSpeedDto speedDto);

    /**
     * 更新
     * @param speedDto 
     */
    void updateResDispatchSpeed(ResDispatchSpeedDto speedDto);

    /**
     * 根据Id主键删除
     * @param id 主键
     */
    void deleteResDispatchSpeedById(Long id);
}

package com.travelsky.basedata.builder;

import com.taocares.commons.beans.BeanUtils;
import com.travelsky.basedata.event.Add${class_name}Event;
import com.travelsky.basedata.event.Delete${class_name}Event;
import com.travelsky.basedata.event.Update${class_name}Event;
import com.travelsky.basedata.event.body.${class_name}MsgBody;
import com.travelsky.basedata.model.entity.${class_name};

/**
 * ${key_annotation}事件构造器
 *
 * @author ${author}
 * @since ${date}
 */
public class ${class_name}EventBuilder {

    /**
     * 构造新增${key_annotation}事件
     * @param ${object_name} ${key_annotation}数据
     * @return 新增${key_annotation}事件
     */
    public Add${class_name}Event buildAddEvent(${class_name} ${object_name}){
        Add${class_name}Event add${class_name}Event = new Add${class_name}Event();
        add${class_name}Event.set${class_name}(BeanUtils.copyProperties(${object_name}, ${class_name}MsgBody.class));
        return add${class_name}Event;
    }

    /**
     * 构造修改${key_annotation}事件
     * @param ${object_name} ${key_annotation}数据
     * @return 修改${key_annotation}事件
     */
    public Update${class_name}Event buildUpdateEvent(${class_name} ${object_name}){
        Update${class_name}Event update${class_name}Event = new Update${class_name}Event();
        update${class_name}Event.set${class_name}(BeanUtils.copyProperties(${object_name}, ${class_name}MsgBody.class));
        return update${class_name}Event;
    }

    /**
     * 构造删除${key_annotation}事件
     * @param ${object_name} ${key_annotation}数据
     * @return 删除${key_annotation}事件
     */
    public Delete${class_name}Event buildDeleteEvent(${class_name} ${object_name}){
        Delete${class_name}Event update${class_name}Event = new Delete${class_name}Event();
        update${class_name}Event.set${class_name}(BeanUtils.copyProperties(${object_name}, ${class_name}MsgBody.class));
        return update${class_name}Event;
    }

}

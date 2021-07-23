package com.travelsky.basedata.event;

import com.travelsky.basedata.enums.EventType;
import com.travelsky.basedata.event.body.${class_name}MsgBody;
import lombok.Data;

/**
 * 删除${key_annotation}事件
 *
 * @author ${author}
 * @since ${date}
 */
@Data
public class Delete${class_name}Event extends AbstractDeleteEvent {

    @Override
    public String getEventType() {
        return EventType.${CLASSNAME}_DELETE.getCode();
    }

    ${class_name}MsgBody ${object_name};

    /**
      * 获取消息体对象
      * @return 消息体对象
    */
    @Override
    protected Object getEsbObject() {
        return ${object_name};
    }
}

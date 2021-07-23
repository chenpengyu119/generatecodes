package com.travelsky.basedata.event;

import com.travelsky.basedata.enums.EventType;
import com.travelsky.basedata.event.body.${class_name}MsgBody;
import lombok.Data;

/**
 * 新增${key_annotation}事件
 *
 * @author ${author}
 * @since ${date}
 */
@Data
public class Add${class_name}Event extends AbstractAddEvent {

    @Override
    public String getEventType() {
        return EventType.${CLASSNAME}_ADD.getCode();
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

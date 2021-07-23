package com.travelsky.basedata.model.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.*;
import java.io.Serializable;


/**
 * ${class_annotation}
 *
 * @author ${author}
 * @since ${date}
 */
@Entity
@Table(name = "${table_name}")
@DynamicInsert(true)
@DynamicUpdate(true)
@Data
public class ${class_name} implements Serializable {

     private static final long serialVersionUID = 1L;

     <#if model_column?exists>
     <#list model_column as model>
     <#if model.columnName = 'ID'>
     /**
      * 主键
      */
     @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
     @Column(name = "${model.columnName}", nullable = false,length = 22,precision = 31)
     private ${model.classType} ${model.propertyName};

     <#elseif model.classType = 'Date'>
     /**
      * ${model.columnComment}
      */
     @Column(name = "${model.columnName}", nullable = ${model.nullable})
     @Mapping(datePattern = "yyyy-MM-dd")
     private ${model.classType} ${model.propertyName};

     <#elseif model.columnName = 'VERSION'>
     /**
      * ${model.columnComment}
      */
     @Version
     @Column(name = "${model.columnName}", nullable = ${model.nullable})
     private ${model.classType} ${model.propertyName};

     <#else>
     /**
      * ${model.columnComment}
      */
     @Column(name = "${model.columnName}", nullable = ${model.nullable})
     private ${model.classType} ${model.propertyName};

     </#if>
     </#list>
     </#if>
}

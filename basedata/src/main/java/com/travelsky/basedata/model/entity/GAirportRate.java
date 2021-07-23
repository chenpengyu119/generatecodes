package com.travelsky.basedata.model.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.*;
import java.io.Serializable;


/**
 * 各机场放行正常率统计表
 *
 * @author pengyuchen
 * @since 2021-07-23 15:17:11
 */
@Entity
@Table(name = "TD_G_AIRPORT_RATE")
@DynamicInsert(true)
@DynamicUpdate(true)
@Data
public class GAirportRate implements Serializable {

     private static final long serialVersionUID = 1L;

     /**
      * 主键
      */
     @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
     @Column(name = "ID", nullable = false,length = 22,precision = 31)
     private Long id;

     /**
      * 机场名称
      */
     @Column(name = "NAME", nullable = true)
     private String name;

     /**
      * 机场三字码
      */
     @Column(name = "PLEG_STATION", nullable = true)
     private String plegStation;

     /**
      * 机场当日放行正常率
      */
     @Column(name = "RELEASE", nullable = true)
     private String release;

     /**
      * 序号，按照放行排行率进行倒序排序
      */
     @Column(name = "RANK", nullable = true)
     private Long rank;

     /**
      * 查询时间(yyyy-MM-dd)
      */
     @Column(name = "QUERY_TIME", nullable = true)
     private String queryTime;

     /**
      * 集团编码
      */
     @Column(name = "GROUP_CODE", nullable = true)
     private String groupCode;

}

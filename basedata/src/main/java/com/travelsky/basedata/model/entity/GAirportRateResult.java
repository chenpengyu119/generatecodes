package com.travelsky.basedata.model.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import javax.persistence.*;
import java.io.Serializable;


/**
 * 放行正常率统计响应表
 *
 * @author pengyuchen
 * @since 2021-07-23 15:17:11
 */
@Entity
@Table(name = "TD_G_AIRPORT_RATE_RESULT")
@DynamicInsert(true)
@DynamicUpdate(true)
@Data
public class GAirportRateResult implements Serializable {

     private static final long serialVersionUID = 1L;

     /**
      * 主键
      */
     @Id
     @GeneratedValue(strategy = GenerationType.AUTO)
     @Column(name = "ID", nullable = false,length = 22,precision = 31)
     private Long id;

     /**
      * 年度放行正常率
      */
     @Column(name = "YEAR_RELEASE", nullable = true)
     private String yearRelease;

     /**
      * 年度始发正常率
      */
     @Column(name = "YEAR_START", nullable = true)
     private String yearStart;

     /**
      * 年度加权
      */
     @Column(name = "YEAR_WEIGHT", nullable = true)
     private String yearWeight;

     /**
      * 年度放行同比
      */
     @Column(name = "YEAR_RELEASE_TST_RATIO", nullable = true)
     private String yearReleaseTstRatio;

     /**
      * 年度始发同比
      */
     @Column(name = "YEAR_START_TST_RATIO", nullable = true)
     private String yearStartTstRatio;

     /**
      * 年度加权同比
      */
     @Column(name = "YEAR_WEIGHT_TST_RATIO", nullable = true)
     private String yearWeightTstRatio;

     /**
      * 当日放行正常率
      */
     @Column(name = "DAY_RELEASE", nullable = true)
     private String dayRelease;

     /**
      * 当日始发正常率
      */
     @Column(name = "DAY_START", nullable = true)
     private String dayStart;

     /**
      * 当日加权
      */
     @Column(name = "DAY_WEIGHT", nullable = true)
     private String dayWeight;

     /**
      * 当日同比
      */
     @Column(name = "DAY_TST_RATIO", nullable = true)
     private String dayTstRatio;

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

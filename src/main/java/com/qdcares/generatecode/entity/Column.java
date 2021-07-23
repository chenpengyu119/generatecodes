package com.qdcares.generatecode.entity;

public class Column {
    /**
     * 数据库字段名称
     */
    private String columnName;
    /**
     * 数据库字段类型
     */
    private String columnType;
    /**
     * 数据库字段首字母小写且去掉下划线字符串
     */
    private String propertyName;
    /**
     * 数据库字段首字母大写且去掉下划线字符串
     */
    private String methodName;
    /**
     * 数据库字段注释
     */
    private String columnComment;
    /**
     * 字段长度
     */
    private String length;
    /**
     * 是否可为空
     */
    private String nullable;
    /**
     * 返回值类型
     */
    private String classType;

    public String getColumnComment() {
        return columnComment;
    }

    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }

    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getNullable() {
        return nullable;
    }

    public void setNullable(String nullable) {
        this.nullable = nullable;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }
}

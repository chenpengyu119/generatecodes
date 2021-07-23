package com.qdcares.generatecode.uitl;

import java.sql.*;

public class DataHandleUtil {
    /**
     * 数据库连接
     */
    private static final String JDBC_DIVER = "oracle.jdbc.driver.OracleDriver";

//    private static final String URL = "jdbc:oracle:thin:@192.168.163.201:1521/travelsky";
    private static final String URL = "jdbc:oracle:thin:@192.168.163.201:1521/aoc";


    private static final String USER = "aoc";

    private static final String PASSWORD = "AocHaoFuZa154!";

    private static Connection connection;

    public static final String COMMENT_SQL = "select a.comments as TABLE_COMMENT from user_tab_comments a where a.table_name = ?";

    public static final String TABLEINFO_SQL = "select " +
            "a.column_name COLUMN_NAME ," +
            "a.data_type DATA_TYPE ," +
            "b.comments COMMENTS ," +
            "a.data_length DATA_LENGTH ," +
            "a.data_precision DATA_PRECISION," +
            "decode(a.NULLABLE,'Y','true','N','false','') NULLABLE " +
            "from " +
            "user_tab_columns a, " +
            "user_col_comments b " +
            "where " +
            "a.Table_Name = b.table_Name "+
            "and a.column_name = b.column_name "+
            "and a.Table_Name = ? order by a.column_id asc";


    public static void createConnection() throws Exception{
        Class.forName(JDBC_DIVER);
        connection = DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static String getLength(String precision, String length){
        if (precision != null && "Date".equals(precision)){
            return "";
        }
        if (precision != null && !"".equals(precision)){
            return "precision = 0";
        }
        return "length = " + length;
    }

    public static String getClassType(String columType,String precision){
        if (columType.contains("VARCHAR")
                || columType.equals("CHAR")
                || columType.equals("BLOB")
                || columType.equals("TEXT")){
            return "String";
        }
        if (columType.contains("INTEGER")
                || columType.equals("NUMBER")){
            if (columType.equals("NUMBER") && "1".equals(precision)){
                return "Boolean";
            }
            return "Long";
        }
        if (columType.contains("DATE")
                || columType.equals("TIMESTAMP")){
            return "Date";
        }
        return "";
    }

    public static String getAnnotationKey(String classAnnotation){
        if(classAnnotation.contains("_")){
            String[] str = classAnnotation.split("_");
            String  keyAnnotation = str[1];
            keyAnnotation = keyAnnotation.replace("基","").trim();
            keyAnnotation = keyAnnotation.replace("础","").trim();
            keyAnnotation = keyAnnotation.replace("表","").trim();
            return keyAnnotation;
        }
        return "";
    }

    public static String getClassName(String tableName){
        if(tableName.contains("_")){
            String[] names = tableName.split("_");
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 1; i < names.length; i++) {
                stringBuilder.append(names[i].substring(0,1).toUpperCase().
                        concat(names[i].substring(1).toLowerCase()));
            }
            String className = stringBuilder.toString();
//            String className = names[names.length - 1].substring(0,1).toUpperCase().
//                    concat(names[names.length - 1].substring(1).toLowerCase());
            return className;
        }
        return "";
    }

    public static String getClassName2(String tableName){
        if(tableName.contains("_")){
            String[] names = tableName.split("_");
            String className = names[names.length - 1].toUpperCase();
            return className;
        }
        return "";
    }

    public static String getObjectName(String tableName){
        if(tableName.contains("_")){
            String[] names = tableName.split("_");
            return names[names.length - 1].toLowerCase();
        }
        return "";
    }

    public static String getFileName(String typeName, Object className){
        if (typeName.contains("_")){
            String[] str = typeName.split("_");
            return  str[0] + className.toString() + str[1];
        }
        if(typeName == null || "".equals(typeName)){
            return className.toString();
        }
        return className.toString() + typeName;
    }

//    public static String getPropertyName(String propertyName){
//        if (propertyName == null)
//            return "";
//        return propertyName.toLowerCase();
//    }

    public static String getMethodName(String propertyName){
        if (propertyName == null || "".equals(propertyName))
            return "";
        return propertyName.substring(0,1).toUpperCase().
                concat(propertyName.substring(1));
    }



    /**
     * 为了处理中间带下划线的情况
     * @param name
     * @return
     */
    public static String getPropertyName(String name) {
        StringBuilder result = new StringBuilder();
        // 快速检查
        if (name == null ) {
            // 没必要转换
            return "";
        } else if (!name.contains("_")) {
            // 不含下划线，仅将首字母小写
            return name.toLowerCase();
        }
        // 用下划线将原始字符串分割
        String camels[] = name.split("_");
        for (String camel :  camels) {
            // 跳过原始字符串中开头、结尾的下换线或双重下划线
            if (camel.equals("")) {
                continue;
            }
            // 处理真正的驼峰片段
            if (result.length() == 0) {
                // 第一个驼峰片段，全部字母都小写
                result.append(camel.toLowerCase());
            } else {
                // 其他的驼峰片段，首字母大写
                result.append(camel.substring(0, 1).toUpperCase());
                result.append(camel.substring(1).toLowerCase());
            }
        }
        return result.toString();
    }

    public static ResultSet getResultSet(String tableName, String sql) throws SQLException {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, tableName);
        ResultSet resultSet = ps.executeQuery();
        return resultSet;
    }

}

package com.qdcares.generatecode.startup;

import com.qdcares.generatecode.entity.Column;
import com.qdcares.generatecode.uitl.CodeFileType;
import com.qdcares.generatecode.uitl.DataHandleUtil;
import com.qdcares.generatecode.uitl.TemplateUtils;
import freemarker.template.Template;
import freemarker.template.TemplateException;

import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 * 暂时仅适配HXBase项目
 */
public class AutoBornCode {
    /**
     * 表空间
     */
    private final String TABLE_SPACE = "AOC";

    /**
     * 序列
     */
    private final String SEQUENCE_NAME = "COMMON_SEQ";

    /**
     *文件生成位置
     */
    private final String DISK_WORKSPACE = "/Volumes/Samsung_T5/0409转移/临时文件夹/0618/归档/";

    /**
     * 作者
     */
    private final String AUTHOR = "pengyuchen";

    /**
     * 时间
     */
    private static String DATE;

    static {
        SimpleDateFormat format  = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        DATE = format.format(new Date());
    }


    public static void main(String[] args) throws Exception{
        //请填写表名
        List<String> tableNames = Arrays.asList(
                "TD_G_AIRPORT_RATE_RESULT", "TD_G_AIRPORT_RATE");
        AutoBornCode autoBornCode = new AutoBornCode();
        for(String tableName : tableNames){
            autoBornCode.generate(tableName);
            System.out.println(tableName);
        }
    }

    public void generate(String tableName){
        try {
            DataHandleUtil.createConnection();
            createFile(initTableInfoMap(tableName));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }


    private Map<String, Object> initTableInfoMap(String tableName) throws SQLException{
        Map<String, Object> map = new HashMap<String, Object>();
        try {

            map.put("author", AUTHOR);
            map.put("date", DATE);
            map.put("table_space", TABLE_SPACE);
            map.put("sequence_name", SEQUENCE_NAME);
            map.put("table_name", tableName);
            map.put("class_name", DataHandleUtil.getClassName(tableName));
            map.put("CLASSNAME", DataHandleUtil.getClassName2(tableName));
            map.put("object_name", DataHandleUtil.getObjectName(tableName));
            ResultSet tableComments = DataHandleUtil.getResultSet(tableName, DataHandleUtil.COMMENT_SQL);
            while(tableComments.next()){
                map.put("class_annotation", tableComments.getString("TABLE_COMMENT"));
                map.put("key_annotation", DataHandleUtil.getAnnotationKey(map.get("class_annotation").toString()));
            }
            ResultSet resultSet =  DataHandleUtil.getResultSet(tableName, DataHandleUtil.TABLEINFO_SQL);
            List<Column> columns = new ArrayList();
            while(resultSet.next()){
                Column column = new Column();
                column.setColumnName(resultSet.getString("COLUMN_NAME"));
                column.setColumnType(resultSet.getString("DATA_TYPE"));
                column.setNullable(resultSet.getString("NULLABLE"));
                column.setPropertyName(DataHandleUtil.getPropertyName(resultSet.getString("COLUMN_NAME")));
                column.setMethodName(DataHandleUtil.getMethodName(column.getPropertyName()));
                column.setColumnComment(resultSet.getString("COMMENTS"));
                column.setClassType(DataHandleUtil.getClassType(column.getColumnType(),resultSet.getString("DATA_PRECISION")));
                column.setLength(DataHandleUtil.getLength(resultSet.getString("DATA_PRECISION"),resultSet.getString("DATA_LENGTH")));
                columns.add(column);
            }
            map.put("model_column",columns);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            return map;

        }
    }

    public void createFile(Map<String, Object> map) throws IOException,TemplateException{
        boolean isDelflag = isDelflag(map);
        for(CodeFileType codeFileType : CodeFileType.values()){
            String javaFileName = DataHandleUtil.getFileName(codeFileType.getName(), map.get("class_name")) + ".java";
            String filePath = DISK_WORKSPACE + codeFileType.getUrl() + javaFileName;
            String fileName = codeFileType.getFileName();
//            if (codeFileType == CodeFileType.SERVICE_IMPL){
//                if (isDelflag){
//                    fileName = "serviceImpl_del.ftl";
//                } else {
//                    fileName = "serviceImpl.ftl";
//                }
//            }
//            if (codeFileType == CodeFileType.DATA_SERVICE){
//                if (isDelflag){
//                    fileName = "dataservice_del.ftl";
//                } else {
//                    fileName = "dataservice.ftl";
//                }
//            }
//            if (codeFileType == CodeFileType.RESPOSITORY_TEST){
//                if (isDelflag){
//                    fileName = "respositorytest_del.ftl";
//                } else {
//                    fileName = "respositorytest.ftl";
//                }
//            }
//            if (codeFileType == CodeFileType.SERVICE_TEST){
//                if (isDelflag){
//                    fileName = "servicetest_del.ftl";
//                } else {
//                    fileName = "servicetest.ftl";
//                }
//            }
            Template template = TemplateUtils.getTemplate(fileName);
            FileOutputStream fos = new FileOutputStream(new File(filePath));
            Writer out = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"),10240);
            template.process(map,out);
            System.err.println("~~~~~~~~" + javaFileName + "已自动生成!");
        }
    }

    private boolean isDelflag(Map<String, Object> map){
        boolean isDelflag = false;
        List<Column> columns = (List<Column>)map.get("model_column");
        for (Column column : columns){
            if (column.getPropertyName().equals("delflag")){
                isDelflag = true;
                break;
            }
        }
        return isDelflag;
    }
}

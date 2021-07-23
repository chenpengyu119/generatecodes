package com.qdcares.generatecode.uitl;

public enum CodeFileType {

    ENTITY("","entity.ftl","/basedata/src/main/java/com/travelsky/basedata/model/entity/");

//    DTO("Dto","dto.ftl","/basedata/src/main/java/com/travelsky/basedata/model/dto/"),

//    REPOSITORY("Repository","repository.ftl","/basedata/src/main/java/com/travelsky/basedata/repository/"),

//    DATA_SERVICE("DataService","dataservice.ftl","/basedata/src/main/java/com/travelsky/basedata/service/data/"),

//    SERVICE("Service","service.ftl","/basedata/src/main/java/com/travelsky/basedata/service/"),
//
//    SERVICE_IMPL("ServiceImpl","serviceImpl.ftl","/basedata/src/main/java/com/travelsky/basedata/service/impl/"),
//
//    CONTROLLER("Controller","controller.ftl","/basedata/src/main/java/com/travelsky/basedata/controller/"),
//
//    MSG_BODY("MsgBody","msgbody.ftl","/basedata/src/main/java/com/travelsky/basedata/event/body/"),
//
//    UPDATE_EVENT("Update_Event","updateevent.ftl","/basedata/src/main/java/com/travelsky/basedata/event/"),
//
//    ADD_EVENT("Add_Event","addevent.ftl","/basedata/src/main/java/com/travelsky/basedata/event/"),
//
//    DELETE_EVENT("Delete_Event","deleteevent.ftl","/basedata/src/main/java/com/travelsky/basedata/event/"),
//
//    EVENT_BUILDER("EventBuilder","eventBuilder.ftl","/basedata/src/main/java/com/travelsky/basedata/builder/"),
//
//    CONTROLLER_TEST("ControllerTest","controllertest.ftl","/basedata/src/test/java/com/travelsky/basedata/controller/"),
//
//    SERVICE_TEST("ServiceTest","servicetest.ftl","/basedata/src/test/java/com/travelsky/basedata/service/");

//    RESPOSITORY_TEST("RepositoryTest","respositorytest.ftl","/basedata/src/test/java/com/travelsky/basedata/repository/");

    private String name;
    private String fileName;
    private String url;

    CodeFileType(String name, String fileName, String url) {
        this.name = name;
        this.fileName = fileName;
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}

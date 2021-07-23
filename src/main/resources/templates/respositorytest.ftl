package com.travelsky.basedata.repository;

import com.travelsky.basedata.model.entity.${class_name};
import com.travelsky.basedata.repository.${class_name}Repository;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Optional;

/**
 * ${key_annotation}持久层测试
 *
 * @author ${author}
 * @since ${date}
 */
@RunWith(SpringRunner.class)
@DataJpaTest
public class ${class_name}RepositoryTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private ${class_name}Repository ${object_name}Repository;

    private ${class_name} ${object_name}Entity = new ${class_name}();

    @Before
    public void setUp(){      
        ${object_name}Entity = new ${class_name}(); 
        <#if model_column?exists>
        <#list model_column as model>
        <#if model.propertyName != 'version' && model.propertyName != 'id'>
        <#if model.classType = 'String'>
        ${object_name}Entity.set${model.methodName}("1");
        <#else><#if model.classType = 'Boolean'>
        ${object_name}Entity.set${model.methodName}(false);
        <#else>
        ${object_name}Entity.set${model.methodName}(1L);
        </#if>
        </#if>
        </#if>
        </#list>
        </#if>
        entityManager.persist(${object_name}Entity);
        entityManager.flush();
    }

    @Test
    public void findAll() {
        List<${class_name}> auditList = ${object_name}Repository.findAll();
        Assert.assertNotNull(auditList);
        Assert.assertEquals(1, auditList.size());
        ${class_name} ${object_name} = auditList.get(0);
        Assert.assertEquals(new Long(1L), ${object_name}.getAirportId());
    }

    @Test
    public void findById() {
        Optional<${class_name}> ${object_name}Opt = ${object_name}Repository.findById(${object_name}Entity.getId());
        Assert.assertTrue(${object_name}Opt.isPresent());
        ${class_name} ${object_name} = ${object_name}Opt.get();
        Assert.assertEquals(new Long(1L), ${object_name}.getAirportId());
    }

    @Test
    public void delete() {
        ${object_name}Repository.delete(${object_name}Entity);
    }

    @Test
    public void save() {
        ${class_name} entity = ${object_name}Repository.save(${object_name}Entity);
        Assert.assertNotNull(entity.getId());
    }

    <#if model_column?exists>
    <#list model_column as model>
    <#if model.propertyName = 'delflag'>
    @Test
    public void findByIdAndDelflag() {
        Optional<${class_name}> ${object_name}Opt = ${object_name}Repository.findByIdAndDelflag(${object_name}Entity.getId(),false);
        Assert.assertTrue(${object_name}Opt.isPresent());
        ${class_name} ${object_name} = ${object_name}Opt.get();
        Assert.assertEquals(new Long(1L), ${object_name}.getAirportId());
    }

    @Test
    public void findAllByDelflag() {
        List<${class_name}> auditList = ${object_name}Repository.findAllByDelflag(false);
        Assert.assertNotNull(auditList);
        Assert.assertEquals(1, auditList.size());
        ${class_name} ${object_name} = auditList.get(0);
        Assert.assertEquals(new Long(1L), ${object_name}.getAirportId());
    }
    </#if>
    </#list>
    </#if>

}
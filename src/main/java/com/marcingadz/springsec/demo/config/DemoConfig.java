package com.marcingadz.springsec.demo.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.logging.Logger;

@Configuration
@EnableWebMvc
@PropertySource("classpath:persistence-mysql.properties")
@ComponentScan(basePackages = "com.marcingadz.springsec.demo")
public class DemoConfig {
    // ViewResolver bean
    private Logger logger = Logger.getLogger(getClass().getName());

    private Environment env;
    @Autowired
    public void setEnv(Environment env) {
        this.env = env;
    }

    private int getIntProperty(String prop) {
        return Integer.parseInt(env.getProperty(prop));
    }

    @Bean
    public DataSource securityDataSource() {
        ComboPooledDataSource source = new ComboPooledDataSource();
        String driverClass = env.getProperty("jdbc.driver");
        try {
            source.setDriverClass(driverClass);
        } catch (PropertyVetoException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        String url = env.getProperty("jdbc.url");
        logger.info("jdbc.url=" + url);
        source.setJdbcUrl(url);
        String user = env.getProperty("jdbc.user");
        logger.info("jdbc.user=" + env.getProperty("jdbc.user"));
        source.setUser(user);
        String password = env.getProperty("jdbc.password");
        source.setPassword(password);
        source.setInitialPoolSize(getIntProperty("connection.pool.initialPoolSize"));
        source.setMinPoolSize(getIntProperty("connection.pool.minPoolSize"));
        source.setMaxPoolSize(getIntProperty("connection.pool.maxPoolSize"));
        source.setMaxIdleTime(getIntProperty("connection.pool.maxIdleTime"));
        return source;
    }

    @Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/view/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
}

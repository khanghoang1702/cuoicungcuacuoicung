package model;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Feedback;

@Generated(value="EclipseLink-2.7.7.v20200504-rNA", date="2021-01-15T12:47:10")
@StaticMetamodel(Users.class)
public class Users_ { 

    public static volatile SingularAttribute<Users, String> userAddress;
    public static volatile SingularAttribute<Users, String> userPassword;
    public static volatile SingularAttribute<Users, Date> dateCreated;
    public static volatile CollectionAttribute<Users, Feedback> feedbackCollection;
    public static volatile SingularAttribute<Users, String> userPhone;
    public static volatile SingularAttribute<Users, String> userEmail;
    public static volatile SingularAttribute<Users, String> userName;
    public static volatile SingularAttribute<Users, Integer> userID;
    public static volatile SingularAttribute<Users, String> userNameID;

}
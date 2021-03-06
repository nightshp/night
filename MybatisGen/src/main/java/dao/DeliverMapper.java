package dao;

import entity.Deliver;
import java.util.List;

public interface DeliverMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliver
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    int deleteByPrimaryKey(Integer deliverId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliver
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    int insert(Deliver record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliver
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    Deliver selectByPrimaryKey(Integer deliverId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliver
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    List<Deliver> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table deliver
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    int updateByPrimaryKey(Deliver record);
}
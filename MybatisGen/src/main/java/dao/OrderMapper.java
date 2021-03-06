package dao;

import entity.Order;
import java.util.List;

public interface OrderMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    int deleteByPrimaryKey(Integer orderId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    int insert(Order record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    Order selectByPrimaryKey(Integer orderId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    List<Order> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order
     *
     * @mbg.generated Sat Aug 18 21:16:41 CST 2018
     */
    int updateByPrimaryKey(Order record);
}
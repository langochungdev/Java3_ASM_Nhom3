package Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class News {
    private String id;
    private String title;
    private String content;
    private String image;
    private Date postedDate;
    private String author;
    private int viewCount;
    private String categoryId;
    private boolean home;
}

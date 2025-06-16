package Entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

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
    
    public News(String id, String title, String content, String image, Date postedDate, String categoryId, boolean home) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.image = image;
        this.postedDate = postedDate;
        this.categoryId = categoryId;
        this.home = home;
    }

}

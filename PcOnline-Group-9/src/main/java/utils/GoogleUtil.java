package utils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import entity.GoogleEn;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import services.GoogleConst;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GoogleUtil {
    public static String getToken(final String code) throws IOException {
        String response = Request.Post(GoogleConst.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GoogleConst.GOOGLE_CLIENT_ID)
                        .add("client_secret", GoogleConst.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri",GoogleConst.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", GoogleConst.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleEn getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = GoogleConst.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleEn googleEn = new Gson().fromJson(response, GoogleEn.class);
        System.out.println(googleEn);
        return googleEn;
    }

}

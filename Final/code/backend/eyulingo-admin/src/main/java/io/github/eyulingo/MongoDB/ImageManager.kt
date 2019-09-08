package io.github.eyulingo.MongoDB
import com.mongodb.*
import org.bson.types.Binary
import java.util.*
import org.springframework.core.io.ClassPathResource


object ImageManager {

    private lateinit var mongoClient: MongoClient

    fun getMongoDBUri(): String {

        // create file input stream object for the properties file
        val fis = ClassPathResource(
                "application.properties").inputStream
        // create Properties class object to access properties file
        val prop = Properties()
        // load the properties file
        prop.load(fis)
        // get the property of "url" using getProperty()

        return prop.getProperty("spring.data.mongodb.uri")
    }

    fun uploadImage(fileName: String, content: Binary): String? {
        val database = mongoClient.getDatabase("eyulingo_imgs")
        val covers = database.getCollection("covers")
//        covers.
        val newFileName = UUID.randomUUID().toString()
        return null
    }

    fun getImage(fileName: String): Binary? {
        val database = mongoClient.getDatabase("eyulingo_imgs")
        val covers = database.getCollection("covers")
        // Performing a read operation on the collection.
        return null
    }
}
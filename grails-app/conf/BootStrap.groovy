class BootStrap {
  def restClientBuilder
    def init = { servletContext ->
       println("***Starting iSentia Twitter Search")

        restClientBuilder.restTemplate.messageConverters.removeAll
                { it.class.name == 'org.springframework.http.converter.json.GsonHttpMessageConverter' }

    }
    def destroy = {
    }
}

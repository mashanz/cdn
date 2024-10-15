use actix_files as fs;
use actix_web::middleware::Logger;
use actix_web::{App, HttpServer};
use env_logger::Env;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    env_logger::init_from_env(Env::default().default_filter_or("info"));

    HttpServer::new(|| {
        App::new()
            .wrap(Logger::new("%a %r %b %{Referer}i %{User-Agent}i %T"))
            .service(fs::Files::new("/", ".")
                .show_files_listing()
                .use_last_modified(true),
        )
    })
    .bind(("0.0.0.0", 8080))?
    .run()
    .await
}

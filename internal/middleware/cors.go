package middleware

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func CORS() gin.HandlerFunc {
	return cors.New(cors.Config{
		// AllowOrigins: []string{
		// "https://pokopoko.vercel.app",
		// },
		AllowAllOrigins: true,
		AllowMethods: []string{
			"GET",
			"POST",
		},
		AllowHeaders: []string{
			"Accept",
			"Content-Type",
			"Content-Length",
			"Accept-Encoding",
			"Accept-Language",
			"X-CSRF-Token",
			"Host",
			"Origin",
			"User-Agent",
		},
		AllowCredentials: false,
	})
}

package main

import (
	"fmt"
	"net/http"
	"github.com/gin-gonic/gin"
)

type Creds struct {
	Username string `json:"username" binding:"required"`
	Password string `json:"password" binding:"required"`
}

var router *gin.Engine

func main() {
	router := gin.Default()
	router.GET("/ping", func(c *gin.Context) {
		c.String(http.StatusOK, "pong")
	})
	router.POST("/login", func(c *gin.Context) {
		var creds Creds
		c.BindJSON(&creds)
		fmt.Printf("Credentials username: %s, password: %s\n",
			creds.Username, creds.Password)
	})
	router.Run()
}

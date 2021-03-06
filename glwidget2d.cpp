/*
glwidget2d.cpp - LTmgc (Ludique's TUIO Multiplexer, Gestures and Screen Calibrator)

Version 0.1 Copyright (C) 2012 LudiqueLabs

This software is provided 'as-is', without any express or implied warranty.
In no event will the authors be held liable for any damages arising from the use of this software.

Permission is granted to anyone to use this software for any purpose, including commercial applications,
and to alter it and redistribute it freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented; you must not
       claim that you wrote the original software. If you use this software in
       a product, an acknowledgment in the product documentation would be appreciated
       but is not required.

    2. Altered source versions must be plainly marked as such, and must not be misrepresented
       as being the original software.

    3. This notice may not be removed or altered from any source distribution.*/
#include <QtGui>
#include <QtOpenGL>

#include <math.h>

#include "glwidget2d.h"

using namespace cv;
glwidget2d::glwidget2d(QWidget *parent)
    : QGLWidget(QGLFormat(QGL::SampleBuffers), parent)
{
    image.create(480,640,CV_8UC3);
    color=true;
    //initializeGL();
    onNewClick=NULL;
}
glwidget2d::~glwidget2d()
{
    onNewClick=NULL;
    //delete cam;
}
/*QSize glwidget2d::minimumSizeHint() const
{
    return QSize(320, 240);
}
QSize glwidget2d::maximumSizeHint() const
{
    return QSize(6400, 4800);
}
QSize glwidget2d::sizeHint() const
{
    return QSize(6400, 4800);
}*/
void glwidget2d::updateImage(bool col, Mat &img)
{
    //img.copyTo(image);
    image=img;
    color=col;
    updateGL();
}
void glwidget2d::initializeGL()
{
    glDisable(GL_DEPTH_TEST);
    glEnable(GL_TEXTURE_2D);
}
void glwidget2d::paintGL()
{
    glClear (GL_COLOR_BUFFER_BIT);		//clear the gl buffers
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR);
    glTexParameterf(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR);
    glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S , GL_REPEAT );
    glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT );
    if(color)
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, image.cols, image.rows, 0, GL_RGB, GL_UNSIGNED_BYTE, image.data);
    else
        glTexImage2D(GL_TEXTURE_2D, 0, GL_LUMINANCE, image.cols, image.rows, 0, GL_LUMINANCE, GL_UNSIGNED_BYTE, image.data);


                glBegin(GL_QUADS);

                // upper left
                glTexCoord2f(0, 0);
                glVertex2f(-1.0, 1.0);
                // upper right
                glTexCoord2f(1.0, 0);
                glVertex2f(1.0, 1.0);
                // bottom right
                glTexCoord2f(1.0, 1.0);
                glVertex2f(1.0, -1.0);
                // bottom left
                glTexCoord2f(0, 1.0);
                glVertex2f(-1.0, -1.0);

                glEnd();
}

void glwidget2d::resizeGL(int width, int height)
{
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-width, width, height, -height, -1.0, 1.0);
    isResized=true;
}

void glwidget2d::mousePressEvent(QMouseEvent *event)
{
    lastPos = event->pos();
    globalLastPos=event->globalPos();
    isNewClick=true;
    cout << "Click in : " << globalLastPos.x() << "," << globalLastPos.y() << endl;
    if(onNewClick!=NULL){
        onNewClick(globalLastPos);
    }
}

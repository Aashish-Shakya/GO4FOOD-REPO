
 
      window.addEventListener('load', () => {
        tilter('.tilter', {
          perspective: 300,
          maxTilt: 4,
          mantain: false,
          fx3d: true,
          fxDistance: 70,
        });
      });
 
class parallaxTiltEffect {  
    constructor({element, tiltEffect}) {  
     this.element = element;  
     this.container = this.element.querySelector(".container");  
     this.size = [300, 360];  
     [this.w, this.h] = this.size;  
     this.tiltEffect = tiltEffect;  
     this.mouseOnComponent = false;  
     this.handleMouseMove = this.handleMouseMove.bind(this);  
     this.handleMouseEnter = this.handleMouseEnter.bind(this);  
     this.handleMouseLeave = this.handleMouseLeave.bind(this);  
     this.defaultStates = this.defaultStates.bind(this);  
     this.setProperty = this.setProperty.bind(this);  
     this.init = this.init.bind(this);  
     this.init();  
    }  
    handleMouseMove(event) {  
     const {offsetX, offsetY} = event;  
     let X;  
     let Y;  
     if (this.tiltEffect === "reverse") {  
      X = ((offsetX - (this.w/2)) / 3) / 3;  
      Y = (-(offsetY - (this.h/2)) / 3) / 3;  
     }  
     else if (this.tiltEffect === "normal") {  
      X = (-(offsetX - (this.w/2)) / 3) / 3;  
      Y = ((offsetY - (this.h/2)) / 3) / 3;  
     }  
     this.setProperty('--rY', X.toFixed(2));  
     this.setProperty('--rX', Y.toFixed(2));  
     this.setProperty('--bY', (80 - (X/4).toFixed(2)) + '%');  
     this.setProperty('--bX', (50 - (Y/4).toFixed(2)) + '%');  
    }  
    handleMouseEnter() {  
     this.mouseOnComponent = true;  
     this.container.classList.add("container--active");  
    }  
    handleMouseLeave() {  
     this.mouseOnComponent = false;  
     this.defaultStates();  
    }  
    defaultStates() {  
     this.container.classList.remove("container--active");  
     this.setProperty('--rY', 0);  
     this.setProperty('--rX', 0);  
     this.setProperty('--bY', '80%');  
     this.setProperty('--bX', '50%');  
    }  
    setProperty(p, v) {  
     return this.container.style.setProperty(p, v);  
    }  
    init() {  
     this.element.addEventListener('mousemove', this.handleMouseMove);  
     this.element.addEventListener('mouseenter', this.handleMouseEnter);  
     this.element.addEventListener('mouseleave', this.handleMouseLeave);  
    }  
   }  
   const $ = e => document.querySelector(e);  
   const wrap1 = new parallaxTiltEffect({  
    element: $('.wrap--1'),  
    tiltEffect: 'reverse'  
   });  
   const wrap2 = new parallaxTiltEffect({  
    element: $('.wrap--2'),  
    tiltEffect: 'normal'  
   });  
   const wrap3 = new parallaxTiltEffect({  
    element: $('.wrap--3'),  
    tiltEffect: 'reverse'  
   });  


   function tilter(element, configs) {
    const tilter = document.querySelectorAll(element);
  
    let conf = {
      perspective: configs != undefined && configs.perspective ? parseInt(configs.perspective) : 400,
      maxTilt: configs != undefined && configs.maxTilt ? parseInt(configs.maxTilt) : 4,
      mantain: configs != undefined && configs.mantain ? Boolean(configs.mantain) : false,
      fx3d: configs != undefined && configs.fx3d ? Boolean(configs.fx3d) : false,
      fxDistance: configs != undefined && configs.fxDistance ? parseInt(configs.fxDistance) : 30,
    }
  
    for (const item of tilter) {
  
      if (conf.fx3d) {
        for (const child of item.children) {
          if (child.classList.contains('fx3d')) {
            child.setAttribute('style', `transform: translateZ(${conf.fxDistance}px) scale(0.7);`)
          }
        }
      }
  
      item.setAttribute('style', `will-change: transform; transform-style: preserve-3d; transform: perspective(${conf.perspective}px) rotateY(0deg) rotateX(0deg);`)
  
      let enter = false;
      item.addEventListener('mouseenter', () => {
        enter = true;
        setTimeout(() => {
          enter = false;
        }, 200);
      });
  
      item.addEventListener('mousemove', e => {
        let left = (e.clientX - item.getBoundingClientRect().left) - (item.offsetWidth / 2);
        let top = (e.clientY - item.getBoundingClientRect().top) - (item.offsetHeight / 2);
  
        let xNatural = (((left / item.offsetWidth) * 2) * 100).toFixed(0)
        let xPercent = xNatural - xNatural * 2;
        let yPercent = (((top / item.offsetHeight) * 2) * 100).toFixed(0);
  
        let xAxis = (xPercent * (conf.maxTilt / 100)).toFixed(2);
        let yAxis = (yPercent * (conf.maxTilt / 100)).toFixed(2);
  
        if (enter) {
          item.setAttribute('style', `transition: .3s cubic-bezier(.03,.98,.52,.99); will-change: transform; transform-style: preserve-3d; transform: perspective(${conf.perspective}px) rotateY(${xAxis}deg) rotateX(${yAxis}deg);`);
        } else {
          item.setAttribute('style', `will-change: transform; transform-style: preserve-3d; transform: perspective(${conf.perspective}px) rotateY(${xAxis}deg) rotateX(${yAxis}deg);`);
        }
  
      });
  
      if (!conf.mantain) {
        item.addEventListener('mouseleave', () => {
          item.setAttribute('style', `transition: all .3s ease-in-out 0s; will-change: transform; transform-style: preserve-3d; transform: perspective(${conf.perspective}px) rotateY(0deg) rotateX(0deg);`)
        });
      }
    }
  }